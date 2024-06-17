import Firebase
import FirebaseFirestore

protocol AnonimPresenterProtocol {
    func sendButtonTapped(message: String)
}

final class AnonimPresenter: AnonimPresenterProtocol {
    // MARK: - PROPERTIES:
    
    unowned let view: AnonimVCProtocol
    
    // MARK: - INIT:
    
    init(view: AnonimVCProtocol) {
        self.view = view
    }
    
    // MARK: - METHODS:
    
    // ANONIM BUTTON TAPPED:
    func sendButtonTapped(message: String) {
        if message == "" {
            let alert = UIAlertController(title: "Ошибка", message: "Пустое поле.\nВведите сообщение.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
            view.showAlert(alert: alert)
        } else {
            let db = Firestore.firestore()
            db.collection("anonymousMessages").addDocument(data: [
                "Сообщение": message
            ]) { [weak self] error in
                if let error = error {
                    let alert = UIAlertController(title: "Ошибка", message: "\(error.localizedDescription)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
                    self?.view.showAlert(alert: alert)
                } else {
                    let alert = UIAlertController(title: "Отправлено", message: "Ваше сообщение отправлено.\nЭто анонимно.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
                    self?.view.showAlert(alert: alert)
                    self?.view.clearTextView()
                }
            }
        }
        view.gestureDone()
    }
}
