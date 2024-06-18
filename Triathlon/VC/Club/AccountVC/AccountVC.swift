import FirebaseAuth
import UIKit

protocol AccountVCProtocol: AnyObject {
    func showRegistretionView()
    func showEnterView()
    func dismissView()
    func deleteAccount()
    func exitAccount()
}

final class AccountVC: UIViewController {
    // MARK: - PROPERTIES:

    var presenter: AccountPresenterProtocol!
    private let vibration = Vibration()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let backgroundImage = UIImageView()
    
    private var segmentedControl = UISegmentedControl()
    
    private let registrationView = UIView()
    private let registrationTitleLabel = UILabel()
    private let registrationEmailTF = UITextField()
    private let registrationPasswordTF = UITextField()
    private let registrationButton = UIButton(type: .system)
    
    private let enterView = UIView()
    private let enterTitleLabel = UILabel()
    private let enterEmailTF = UITextField()
    private let enterPasswordTF = UITextField()
    private let enterButton = UIButton(type: .system)
    
    private let authView = UIView()
    private let authTitleLabel = UILabel()
    
    private let exitButton = UIButton(type: .system)
    private let deleteButton = UIButton(type: .system)
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkUserAuthenticationStatus()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(backgroundImage, segmentedControl, registrationView, enterView, authTitleLabel, exitButton, deleteButton)
        registrationView.addSubviews(registrationTitleLabel, registrationTitleLabel, registrationEmailTF, registrationPasswordTF, registrationButton)
        enterView.addSubviews(enterTitleLabel, enterEmailTF, enterPasswordTF, enterButton)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // BACKGROUND VIEW:
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // SEGMENTED CONTROL:
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        
        // AUTH LABEL:
        authTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        authTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        authTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // REGISTRATION VIEW:
        registrationView.translatesAutoresizingMaskIntoConstraints = false
        registrationView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 15).isActive = true
        registrationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        registrationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
        // REGISTRATION TITLE:
        registrationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        registrationTitleLabel.centerXAnchor.constraint(equalTo: registrationView.centerXAnchor).isActive = true
        registrationTitleLabel.topAnchor.constraint(equalTo: registrationView.topAnchor, constant: 25).isActive = true
        
        // REGISTRATION EMAIL:
        registrationEmailTF.translatesAutoresizingMaskIntoConstraints = false
        registrationEmailTF.topAnchor.constraint(equalTo: registrationTitleLabel.bottomAnchor, constant: 25).isActive = true
        registrationEmailTF.centerXAnchor.constraint(equalTo: registrationView.centerXAnchor).isActive = true
        registrationEmailTF.widthAnchor.constraint(equalTo: registrationView.widthAnchor, multiplier: 0.75).isActive = true
        registrationEmailTF.heightAnchor.constraint(equalTo: registrationEmailTF.widthAnchor, multiplier: 0.15).isActive = true
        
        // REGISTRATION PASSWORD:
        registrationPasswordTF.translatesAutoresizingMaskIntoConstraints = false
        registrationPasswordTF.topAnchor.constraint(equalTo: registrationEmailTF.bottomAnchor, constant: 25).isActive = true
        registrationPasswordTF.centerXAnchor.constraint(equalTo: registrationView.centerXAnchor).isActive = true
        registrationPasswordTF.widthAnchor.constraint(equalTo: registrationView.widthAnchor, multiplier: 0.75).isActive = true
        registrationPasswordTF.heightAnchor.constraint(equalTo: registrationPasswordTF.widthAnchor, multiplier: 0.15).isActive = true
        
        // REGISTRATION BUTTON:
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.topAnchor.constraint(equalTo: registrationPasswordTF.bottomAnchor, constant: 25).isActive = true
        registrationButton.centerXAnchor.constraint(equalTo: registrationView.centerXAnchor).isActive = true
        registrationButton.widthAnchor.constraint(equalTo: registrationView.widthAnchor, multiplier: 0.5).isActive = true
        registrationButton.heightAnchor.constraint(equalTo: registrationButton.widthAnchor, multiplier: 0.2).isActive = true
        
        // ENTER VIEW:
        enterView.translatesAutoresizingMaskIntoConstraints = false
        enterView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 15).isActive = true
        enterView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        enterView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
        // ENTER TITLE:
        enterTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        enterTitleLabel.centerXAnchor.constraint(equalTo: enterView.centerXAnchor).isActive = true
        enterTitleLabel.topAnchor.constraint(equalTo: enterView.topAnchor, constant: 25).isActive = true
        
        // ENTER EMAIL:
        enterEmailTF.translatesAutoresizingMaskIntoConstraints = false
        enterEmailTF.topAnchor.constraint(equalTo: enterTitleLabel.bottomAnchor, constant: 25).isActive = true
        enterEmailTF.centerXAnchor.constraint(equalTo: enterView.centerXAnchor).isActive = true
        enterEmailTF.widthAnchor.constraint(equalTo: enterView.widthAnchor, multiplier: 0.75).isActive = true
        enterEmailTF.heightAnchor.constraint(equalTo: enterEmailTF.widthAnchor, multiplier: 0.15).isActive = true
        
        // ENTER PASSWORD:
        enterPasswordTF.translatesAutoresizingMaskIntoConstraints = false
        enterPasswordTF.topAnchor.constraint(equalTo: enterEmailTF.bottomAnchor, constant: 25).isActive = true
        enterPasswordTF.centerXAnchor.constraint(equalTo: enterView.centerXAnchor).isActive = true
        enterPasswordTF.widthAnchor.constraint(equalTo: enterView.widthAnchor, multiplier: 0.75).isActive = true
        enterPasswordTF.heightAnchor.constraint(equalTo: enterPasswordTF.widthAnchor, multiplier: 0.15).isActive = true
        
        // ENTER BUTTON:
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.topAnchor.constraint(equalTo: enterPasswordTF.bottomAnchor, constant: 25).isActive = true
        enterButton.centerXAnchor.constraint(equalTo: enterView.centerXAnchor).isActive = true
        enterButton.widthAnchor.constraint(equalTo: enterView.widthAnchor, multiplier: 0.5).isActive = true
        enterButton.heightAnchor.constraint(equalTo: enterButton.widthAnchor, multiplier: 0.2).isActive = true
        
        // EXIT BUTTON:
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        exitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        
        // DELETE BUTTON:
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        deleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // BACKGROUND VIEW:
        backgroundImage.image = UIImage(resource: .background)
        
        // SEGMENT CONTROL
        segmentedControl.backgroundColor = .clear
        segmentedControl.selectedSegmentTintColor = .colorBackground
        let normalTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        segmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        segmentedControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        segmentedControl.insertSegment(withTitle: "Регистрация", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Вход", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.opacity = 1
        segmentedControl.isHidden = false
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        // AUTH LABEL:
        authTitleLabel.textColor = .white
        authTitleLabel.textAlignment = .center
        authTitleLabel.numberOfLines = 0
        authTitleLabel.font = fontBoldStandard22
        authTitleLabel.layer.opacity = 0.0
        authTitleLabel.isHidden = true
        
        // REGISTRATION VIEW:
        registrationView.layer.opacity = 1
        registrationView.isHidden = false
        
        // REGISTRATION TITLE:
        registrationTitleLabel.textColor = .white
        registrationTitleLabel.textAlignment = .center
        registrationTitleLabel.font = fontBoldStandard22
        registrationTitleLabel.text = "Регистрация"
        registrationTitleLabel.layer.opacity = 1
        
        // REGISTRATION EMAIL:
        registrationEmailTF.layer.masksToBounds = true
        registrationEmailTF.layer.cornerRadius = cornerRadius
        registrationEmailTF.layer.borderWidth = 0.7
        registrationEmailTF.layer.borderColor = UIColor.white.cgColor
        registrationEmailTF.textColor = .white
        registrationEmailTF.backgroundColor = .colorBackground
        registrationEmailTF.placeholder = "Электронная почта"
        registrationEmailTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: registrationEmailTF.frame.height))
        registrationEmailTF.leftViewMode = .always
        registrationEmailTF.layer.opacity = 1
        
        // REGISTRATION PASSWORD:
        registrationPasswordTF.layer.masksToBounds = true
        registrationPasswordTF.layer.cornerRadius = cornerRadius
        registrationPasswordTF.layer.borderWidth = 0.7
        registrationPasswordTF.layer.borderColor = UIColor.white.cgColor
        registrationPasswordTF.textColor = .white
        registrationPasswordTF.backgroundColor = .colorBackground
        registrationPasswordTF.placeholder = "Пароль"
        registrationPasswordTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: registrationPasswordTF.frame.height))
        registrationPasswordTF.leftViewMode = .always
        registrationPasswordTF.layer.opacity = 1
        
        // REGISTRATION BUTTON:
        registrationButton.layer.masksToBounds = true
        registrationButton.layer.cornerRadius = cornerRadius
        registrationButton.backgroundColor = .systemGreen
        registrationButton.setTitle("Зарегистрироваться", for: .normal)
        registrationButton.titleLabel?.font = fontMediumStandard14
        registrationButton.setTitleColor(.white, for: .normal)
        registrationButton.layer.opacity = 1
        registrationButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.vibration.vibrationStandart()
            self.activityIndicator.center = view.center
            self.activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
            self.presenter.registerUser(email: self.registrationEmailTF.text ?? "", password: self.registrationPasswordTF.text ?? "") { result in
                switch result {
                case .success:
                    self.present(self.presenter.showAlert(title: "Выполнено", message: "Вы успешно зарегистрированы!"), animated: true)
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.removeFromSuperview()
                case .failure(let error):
                    self.present(self.presenter.showAlert(title: "Ошибка", message: "\(error.localizedDescription)"), animated: true)
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.removeFromSuperview()
                }
            }
        }), for: .touchUpInside)
        
        // ENTER VIEW:
        enterView.layer.opacity = 0.0
        enterView.isHidden = true
        
        // ENTER TITLE:
        enterTitleLabel.textColor = .white
        enterTitleLabel.textAlignment = .center
        enterTitleLabel.font = fontBoldStandard22
        enterTitleLabel.text = "Вход"
        enterTitleLabel.layer.opacity = 0.0
        
        // ENTER EMAIL:
        enterEmailTF.layer.masksToBounds = true
        enterEmailTF.layer.cornerRadius = cornerRadius
        enterEmailTF.layer.borderWidth = 1
        enterEmailTF.layer.borderColor = UIColor.white.cgColor
        enterEmailTF.textColor = .white
        enterEmailTF.backgroundColor = .colorBackground
        enterEmailTF.placeholder = "Электронная почта"
        enterEmailTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: registrationEmailTF.frame.height))
        enterEmailTF.leftViewMode = .always
        enterEmailTF.layer.opacity = 0.0
        
        // ENTER PASSWORD:
        enterPasswordTF.layer.masksToBounds = true
        enterPasswordTF.layer.cornerRadius = cornerRadius
        enterPasswordTF.layer.borderWidth = 1
        enterPasswordTF.layer.borderColor = UIColor.white.cgColor
        enterPasswordTF.textColor = .white
        enterPasswordTF.backgroundColor = .colorBackground
        enterPasswordTF.placeholder = "Пароль"
        enterPasswordTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: registrationPasswordTF.frame.height))
        enterPasswordTF.leftViewMode = .always
        enterPasswordTF.layer.opacity = 0.0
        
        // ENTER BUTTON:
        enterButton.layer.masksToBounds = true
        enterButton.layer.cornerRadius = cornerRadius
        enterButton.backgroundColor = .systemGreen
        enterButton.setTitle("Войти", for: .normal)
        enterButton.titleLabel?.font = fontMediumStandard14
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.layer.opacity = 0.0
        enterButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.vibration.vibrationStandart()
            self.activityIndicator.center = view.center
            self.activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
            self.presenter.signInUser(email: self.enterEmailTF.text ?? "", password: self.enterPasswordTF.text ?? "") { result in
                switch result {
                case .success:
                    self.present(self.presenter.showAlert(title: "Выполнено", message: "Вы успешно вошли!"), animated: true)
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.removeFromSuperview()
                case .failure(let error):
                    self.present(self.presenter.showAlert(title: "Ошибка", message: "\(error.localizedDescription)"), animated: true)
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.removeFromSuperview()
                }
            }
        }), for: .touchUpInside)
        
        // EXIT BUTTON:
        exitButton.setTitle("Выйти из аккаунта", for: .normal)
        exitButton.setTitleColor(.systemRed, for: .normal)
        exitButton.titleLabel?.font = fontMediumStandard14
        exitButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.vibration.vibrationStandart()
            self.present(self.presenter.confirmExitAlert(), animated: true)
        }), for: .touchUpInside)
        
        // DELETE BUTTON:
        deleteButton.setTitle("Удалить аккаунт", for: .normal)
        deleteButton.setTitleColor(.systemRed, for: .normal)
        deleteButton.titleLabel?.font = fontMediumStandard14
        deleteButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.vibration.vibrationStandart()
            self.present(self.presenter.confirmDeleteAlert(),animated: true)
        }), for: .touchUpInside)
    }
    
    // MARK: - HELPERS:
        
    // SEGMENTED CONTROL VALUE CHANGED:
    @objc private func segmentedControlValueChanged(sender: UISegmentedControl) {
        vibration.vibrationStandart()
        presenter.selectedSegmentControl(sender: sender)
    }
    
    // CHECK AUTH:
    func checkUserAuthenticationStatus() {
        DispatchQueue.main.async {
            if let user = Auth.auth().currentUser {
                self.authTitleLabel.layer.opacity = 1
                self.authTitleLabel.isHidden = false
                self.authTitleLabel.text = "Вы аутентифицированы\n\(user.email ?? "Не указан")"
                self.segmentedControl.layer.opacity = 0.0
                self.segmentedControl.isHidden = true
                self.registrationView.layer.opacity = 0.0
                self.registrationView.isHidden = true
                self.enterView.layer.opacity = 0.0
                self.enterView.isHidden = true
                self.exitButton.isHidden = false
                self.deleteButton.isHidden = false
                print("Пользователь аутентифицирован, email: \(user.email ?? "Не указан")")
            } else {
                self.authTitleLabel.layer.opacity = 0.0
                self.authTitleLabel.isHidden = true
                self.segmentedControl.layer.opacity = 1
                self.segmentedControl.isHidden = false
                self.registrationView.layer.opacity = 1
                self.registrationView.isHidden = false
                self.enterView.layer.opacity = 0.0
                self.enterView.isHidden = true
                self.exitButton.isHidden = true
                self.deleteButton.isHidden = true
                print("Пользователь не аутентифицирован")
            }
        }
    }
}

// MARK: - EXTENSIONS:

extension AccountVC: AccountVCProtocol {
    // SHOW REGISTRATION VIEW:
    func showRegistretionView() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.authTitleLabel.isHidden = true
            self.registrationView.isHidden = false
            self.enterView.isHidden = true
            self.registrationView.layer.opacity = 1
            self.registrationTitleLabel.layer.opacity = 1
            self.registrationEmailTF.layer.opacity = 1
            self.registrationPasswordTF.layer.opacity = 1
            self.registrationButton.layer.opacity = 1
            self.enterView.layer.opacity = 0
            self.enterTitleLabel.layer.opacity = 0
            self.enterEmailTF.layer.opacity = 0
            self.enterPasswordTF.layer.opacity = 0
            self.enterButton.layer.opacity = 0
        }
    }
    
    // SHOW ENTER VIEW:
    func showEnterView() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.authTitleLabel.isHidden = true
            self.registrationView.isHidden = true
            self.enterView.isHidden = false
            self.registrationView.layer.opacity = 0
            self.registrationTitleLabel.layer.opacity = 0
            self.registrationEmailTF.layer.opacity = 0
            self.registrationPasswordTF.layer.opacity = 0
            self.registrationButton.layer.opacity = 0
            self.enterView.layer.opacity = 1
            self.enterTitleLabel.layer.opacity = 1
            self.enterEmailTF.layer.opacity = 1
            self.enterPasswordTF.layer.opacity = 1
            self.enterButton.layer.opacity = 1
        }
    }
    
    // DISMISS VIEW:
    func dismissView() {
        dismiss(animated: true)
    }
    
    // DELETE ACCOUNT:
    func deleteAccount() {
        self.activityIndicator.center = view.center
        self.activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        self.presenter.deleteUser { result in
            switch result {
            case .success:
                self.present(self.presenter.showAlert(title: "Успешно", message: "Аккаунт удален"), animated: true)
                self.activityIndicator.stopAnimating()
                self.activityIndicator.removeFromSuperview()
            case .failure(let error):
                self.present(self.presenter.showAlert(title: "Ошибка", message: "\(error.localizedDescription)"), animated: true)
                self.activityIndicator.stopAnimating()
                self.activityIndicator.removeFromSuperview()
            }
        }
    }
    
    // EXIT ACCOUNT:
    func exitAccount() {
        self.activityIndicator.center = view.center
        self.activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        self.presenter.exitUser { result in
            switch result {
            case .success:
                self.present(self.presenter.showAlert(title: "Успешно", message: "Вы вышли из аккаунта"), animated: true)
            case .failure(let error):
                self.present(self.presenter.showAlert(title: "Ошибка", message: "\(error.localizedDescription)"), animated: true)
            }
        }
    }
}
