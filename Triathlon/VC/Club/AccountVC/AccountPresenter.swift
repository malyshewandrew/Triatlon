import FirebaseAuth
import UIKit

protocol AccountPresenterProtocol {
    func selectedSegmentControl(sender: UISegmentedControl)
    func showAlert(title: String, message: String) -> UIAlertController
    func registerUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func signInUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
    func deleteUser(completion: @escaping (Result<User, Error>) -> Void)
    func exitUser(completion: @escaping (Result<Void, Error>) -> Void)
    func confirmExitAlert() -> UIAlertController
    func confirmDeleteAlert() -> UIAlertController
    func confirmReset() -> UIAlertController
    func resetPassword(email: String)
}

final class AccountPresenter: AccountPresenterProtocol {
    // MARK: - PROPERTIES:
    
    unowned let view: AccountVCProtocol
    
    // MARK: - INIT:
    
    init(view: AccountVCProtocol) {
        self.view = view
    }
    
    // MARK: - METHODS:
    
    // SHOW ALERT:
    func showAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            self.view.dismissView()
        }))
        return alert
    }
    
    // SELECTED SEGMENTED CONTROL:
    func selectedSegmentControl(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.showRegistretionView()
        case 1:
            view.showEnterView()
        default:
            view.showRegistretionView()
        }
    }
    
    // REGISTER USER:
    func registerUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = authResult?.user {
                completion(.success(user))
            }
        }
    }
    
    // SIGN IN:
    func signInUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = authResult?.user {
                completion(.success(user))
            }
        }
    }
    
    // DELETE USER:
    func deleteUser(completion: @escaping (Result<User, Error>) -> Void) {
        guard let user = Auth.auth().currentUser else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Пользователь не аутентифицирован"])
            completion(.failure(error))
            return
        }
        user.delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    // CONFIRM DELETE ALERT:
    func confirmDeleteAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Удаление аккаунта", message: "Действительно удалить аккаунт?\n\nЭто действия нельзя будет отменить.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Удалить", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            view.deleteAccount()
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { [weak self] _ in
            guard let self = self else { return }
            self.view.dismissView()
        }))
        return alert
    }
    
    // EXIT USER:
    func exitUser(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(.success(()))
        } catch let signOutError as NSError {
            completion(.failure(signOutError))
        }
    }
    
    // CONFIRM EXIT ALERT:
    func confirmExitAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Выход из аккаунта", message: "Действительно выйти из аккаунта?\n\nВы сможете зайти повторно с помощью своей электронной почты и пароля.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Выйти", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            view.exitAccount()
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { [weak self] _ in
            guard let self = self else { return }
            self.view.dismissView()
        }))
        return alert
    }
    
    // RESET PASSWORD BUTTON:
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                self.view.errorReset(error: "\(error.localizedDescription).")
                return
            }
            self.view.successReset()
            print("Инструкция по сбросу пароля отправлена на ваш email")
        }
    }
    
    func confirmReset() -> UIAlertController {
        let alert = UIAlertController(title: "Сброс пароля", message: "Введите Email.\nПоле для пароля оставьте пустым.\n\nФорма для сброса пароля придет на электронную почту.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Сбросить", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            view.resetPassword()
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { [weak self] _ in
            guard let self = self else { return }
            self.view.dismissView()
        }))
        return alert
    }
}
