import FirebaseAuth
import FirebaseFirestore
import UIKit

protocol AccountVCProtocol: AnyObject {
    func showRegistretionView()
    func showEnterView()
    func dismissView()
    func deleteAccount()
    func exitAccount()
    func resetPassword()
    func successReset()
    func errorReset(error: String)
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
    private let registrationSurnameTF = UITextField()
    private let registrationNameTF = UITextField()
    private let registrationEmailTF = UITextField()
    private let registrationPasswordTF = UITextField()
    private let registrationPasswordRepeatTF = UITextField()
    private let registrationGroupTF = UITextField()
    private let registrationGroupPV = UIPickerView()
    private let registrationButton = UIButton(type: .system)
    
    private let enterView = UIView()
    private let enterTitleLabel = UILabel()
    private let enterEmailTF = UITextField()
    private let enterPasswordTF = UITextField()
    private let enterButton = UIButton(type: .system)
    private let resetPasswordButton = UIButton(type: .system)
    
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
        configureGestures()
        registrationGroupPV.delegate = self
        registrationGroupPV.dataSource = self
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(backgroundImage, segmentedControl, registrationView, enterView, authTitleLabel, exitButton, deleteButton)
        registrationView.addSubviews(registrationTitleLabel, registrationTitleLabel, registrationSurnameTF, registrationNameTF, registrationEmailTF, registrationPasswordTF, registrationPasswordRepeatTF, registrationGroupTF, registrationButton)
        enterView.addSubviews(enterTitleLabel, enterEmailTF, enterPasswordTF, enterButton, resetPasswordButton)
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
        registrationView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 25).isActive = true
        registrationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        registrationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
        // REGISTRATION TITLE:
        registrationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        registrationTitleLabel.centerXAnchor.constraint(equalTo: registrationView.centerXAnchor).isActive = true
        registrationTitleLabel.topAnchor.constraint(equalTo: registrationView.topAnchor).isActive = true
        
        // REGISTRATION SURNAME:
        registrationSurnameTF.translatesAutoresizingMaskIntoConstraints = false
        registrationSurnameTF.topAnchor.constraint(equalTo: registrationTitleLabel.bottomAnchor, constant: 25).isActive = true
        registrationSurnameTF.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5).isActive = true
        registrationSurnameTF.widthAnchor.constraint(equalTo: registrationView.widthAnchor, multiplier: 0.45).isActive = true
        registrationSurnameTF.heightAnchor.constraint(equalTo: registrationSurnameTF.widthAnchor, multiplier: 0.2).isActive = true
        
        // REGISTRATION NAME:
        registrationNameTF.translatesAutoresizingMaskIntoConstraints = false
        registrationNameTF.topAnchor.constraint(equalTo: registrationTitleLabel.bottomAnchor, constant: 25).isActive = true
        registrationNameTF.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 5).isActive = true
        registrationNameTF.widthAnchor.constraint(equalTo: registrationView.widthAnchor, multiplier: 0.45).isActive = true
        registrationNameTF.heightAnchor.constraint(equalTo: registrationNameTF.widthAnchor, multiplier: 0.2).isActive = true
        
        // REGISTRATION EMAIL:
        registrationEmailTF.translatesAutoresizingMaskIntoConstraints = false
        registrationEmailTF.topAnchor.constraint(equalTo: registrationSurnameTF.bottomAnchor, constant: 15).isActive = true
        registrationEmailTF.leadingAnchor.constraint(equalTo: registrationPasswordTF.leadingAnchor).isActive = true
        registrationEmailTF.trailingAnchor.constraint(equalTo: registrationPasswordRepeatTF.trailingAnchor).isActive = true
        registrationEmailTF.heightAnchor.constraint(equalTo: registrationEmailTF.widthAnchor, multiplier: 0.1).isActive = true
        
        // REGISTRATION PASSWORD:
        registrationPasswordTF.translatesAutoresizingMaskIntoConstraints = false
        registrationPasswordTF.topAnchor.constraint(equalTo: registrationEmailTF.bottomAnchor, constant: 15).isActive = true
        registrationPasswordTF.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5).isActive = true
        registrationPasswordTF.widthAnchor.constraint(equalTo: registrationView.widthAnchor, multiplier: 0.45).isActive = true
        registrationPasswordTF.heightAnchor.constraint(equalTo: registrationPasswordTF.widthAnchor, multiplier: 0.2).isActive = true
        
        // REGISTRATION PASSWORD REPEAT:
        registrationPasswordRepeatTF.translatesAutoresizingMaskIntoConstraints = false
        registrationPasswordRepeatTF.topAnchor.constraint(equalTo: registrationEmailTF.bottomAnchor, constant: 15).isActive = true
        registrationPasswordRepeatTF.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 5).isActive = true
        registrationPasswordRepeatTF.widthAnchor.constraint(equalTo: registrationView.widthAnchor, multiplier: 0.45).isActive = true
        registrationPasswordRepeatTF.heightAnchor.constraint(equalTo: registrationPasswordRepeatTF.widthAnchor, multiplier: 0.2).isActive = true
        
        // REGISTRATION GROUP TEXT FIELD + PICKER VIEW:
        registrationGroupTF.translatesAutoresizingMaskIntoConstraints = false
        registrationGroupTF.topAnchor.constraint(equalTo: registrationPasswordTF.bottomAnchor, constant: 15).isActive = true
        registrationGroupTF.leadingAnchor.constraint(equalTo: registrationPasswordTF.leadingAnchor).isActive = true
        registrationGroupTF.trailingAnchor.constraint(equalTo: registrationPasswordRepeatTF.trailingAnchor).isActive = true
        registrationGroupTF.heightAnchor.constraint(equalTo: registrationGroupTF.widthAnchor, multiplier: 0.1).isActive = true
        
        registrationGroupPV.translatesAutoresizingMaskIntoConstraints = false
        
        // REGISTRATION BUTTON:
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.topAnchor.constraint(equalTo: registrationGroupTF.bottomAnchor, constant: 15).isActive = true
        registrationButton.centerXAnchor.constraint(equalTo: registrationView.centerXAnchor).isActive = true
        registrationButton.widthAnchor.constraint(equalTo: registrationView.widthAnchor, multiplier: 0.5).isActive = true
        registrationButton.heightAnchor.constraint(equalTo: registrationButton.widthAnchor, multiplier: 0.2).isActive = true
        
        // ENTER VIEW:
        enterView.translatesAutoresizingMaskIntoConstraints = false
        enterView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 25).isActive = true
        enterView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        enterView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
        // ENTER TITLE:
        enterTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        enterTitleLabel.centerXAnchor.constraint(equalTo: enterView.centerXAnchor).isActive = true
        enterTitleLabel.topAnchor.constraint(equalTo: enterView.topAnchor).isActive = true
        
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
        
        // RESET PASSWORD BUTTON:
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resetPasswordButton.bottomAnchor.constraint(equalTo: enterView.bottomAnchor, constant: -5).isActive = true
        
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
        
        // REGISTRATION SURNAME:
        registrationSurnameTF.layer.masksToBounds = true
        registrationSurnameTF.layer.cornerRadius = cornerRadius
        registrationSurnameTF.layer.borderWidth = 0.7
        registrationSurnameTF.layer.borderColor = UIColor.white.cgColor
        registrationSurnameTF.textColor = .white
        registrationSurnameTF.backgroundColor = .colorBackground
        registrationSurnameTF.placeholder = "Фамилия"
        registrationSurnameTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: registrationSurnameTF.frame.height))
        registrationSurnameTF.leftViewMode = .always
        registrationSurnameTF.layer.opacity = 1
        
        // REGISTRATION NAME:
        registrationNameTF.layer.masksToBounds = true
        registrationNameTF.layer.cornerRadius = cornerRadius
        registrationNameTF.layer.borderWidth = 0.7
        registrationNameTF.layer.borderColor = UIColor.white.cgColor
        registrationNameTF.textColor = .white
        registrationNameTF.backgroundColor = .colorBackground
        registrationNameTF.placeholder = "Имя"
        registrationNameTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: registrationNameTF.frame.height))
        registrationNameTF.leftViewMode = .always
        registrationNameTF.layer.opacity = 1
        
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
        
        // REGISTRATION PASSWORD REPEAT:
        registrationPasswordRepeatTF.layer.masksToBounds = true
        registrationPasswordRepeatTF.layer.cornerRadius = cornerRadius
        registrationPasswordRepeatTF.layer.borderWidth = 0.7
        registrationPasswordRepeatTF.layer.borderColor = UIColor.white.cgColor
        registrationPasswordRepeatTF.textColor = .white
        registrationPasswordRepeatTF.backgroundColor = .colorBackground
        registrationPasswordRepeatTF.placeholder = "Повторите пароль"
        registrationPasswordRepeatTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: registrationPasswordRepeatTF.frame.height))
        registrationPasswordRepeatTF.leftViewMode = .always
        registrationPasswordRepeatTF.layer.opacity = 1
        
        // REGISTRATION GROUP TEXT FIELD:
        registrationGroupTF.layer.masksToBounds = true
        registrationGroupTF.layer.cornerRadius = cornerRadius
        registrationGroupTF.layer.borderWidth = 0.7
        registrationGroupTF.layer.borderColor = UIColor.white.cgColor
        registrationGroupTF.textColor = .white
        registrationGroupTF.backgroundColor = .colorBackground
        registrationGroupTF.placeholder = "Группа"
        registrationGroupTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: registrationGroupTF.frame.height))
        registrationGroupTF.leftViewMode = .always
        registrationGroupTF.layer.opacity = 1
        registrationGroupTF.inputView = registrationGroupPV
        registrationGroupPV.backgroundColor = .colorBackground
        
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
            guard self.registrationPasswordTF.text == self.registrationPasswordRepeatTF.text else {
                present(self.presenter.showAlert(title: "Ошибка", message: "Пароли не совпадают"), animated: true)
                return
            }
            guard let surname = self.registrationSurnameTF.text, !surname.isEmpty,
                  let name = self.registrationNameTF.text, !name.isEmpty,
                  let email = self.registrationEmailTF.text, !email.isEmpty,
                  let password = self.registrationPasswordTF.text, !password.isEmpty,
                  let passwordRepeat = self.registrationPasswordRepeatTF.text, !passwordRepeat.isEmpty,
                  let group = self.registrationGroupTF.text, !group.isEmpty
            else {
                present(self.presenter.showAlert(title: "Ошибка", message: "Заполните все поля"), animated: true)
                return
            }
            self.vibration.vibrationStandart()
            self.activityIndicator.center = view.center
            self.activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
            self.presenter.registerUser(surname: registrationSurnameTF.text ?? "", name: registrationNameTF.text ?? "", email: self.registrationEmailTF.text ?? "", password: self.registrationPasswordTF.text ?? "", group: registrationGroupTF.text ?? "") { result in
                switch result {
                case .success:
                    self.present(self.presenter.showAlert(title: "Выполнено", message: "Вы успешно зарегистрированы!"), animated: true)
                    guard let group = self.registrationGroupTF.text else { return }
                    UserDefaults.standard.set(group, forKey: "userGroup")
                    print("USER DEFAULTS определил пользователя в группу: \(UserDefaults.standard.string(forKey: "userGroup") ?? "")")
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
        
        // RESET PASSWORD BUTTON:
        resetPasswordButton.setTitle("Не помню пароль", for: .normal)
        resetPasswordButton.setTitleColor(.systemRed, for: .normal)
        resetPasswordButton.titleLabel?.font = fontMediumStandard14
        resetPasswordButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.vibration.vibrationStandart()
            self.present(self.presenter.confirmReset(), animated: true)
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
            self.present(self.presenter.confirmDeleteAlert(), animated: true)
        }), for: .touchUpInside)
    }
    
    // MARK: - CONFIGURE GESTURES:
    
    private func configureGestures() {
        // TAP ON FREE SPACE FOR CLOSE ALL VIEWS:
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        view.addGestureRecognizer(tapGesture)
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
                self.segmentedControl.layer.opacity = 0.0
                self.segmentedControl.isHidden = true
                self.registrationView.layer.opacity = 0.0
                self.registrationView.isHidden = true
                self.enterView.layer.opacity = 0.0
                self.enterView.isHidden = true
                self.exitButton.isHidden = false
                self.deleteButton.isHidden = false
                if let userGroup = UserDefaults.standard.string(forKey: "userGroup") {
                    self.authTitleLabel.text = "Аккаунт:\n\(user.email ?? "Не указан")\n\n\(userGroup)"
                } else {
                    self.authTitleLabel.text = "Аккаунт:\n\(user.email ?? "Не указан")\n\nГруппа не указана"
                }
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
    
    // TAP ON FREE SPACE FOR CLOSE ALL VIEWS ACTION:
    @objc private func tapGestureDone() {
        view.endEditing(true)
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
            self.registrationSurnameTF.layer.opacity = 1
            self.registrationNameTF.layer.opacity = 1
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
            self.registrationSurnameTF.layer.opacity = 0
            self.registrationSurnameTF.layer.opacity = 0
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
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        presenter.deleteUser { result in
            switch result {
            case .success:
                self.present(self.presenter.showAlert(title: "Успешно", message: "Аккаунт удален"), animated: true)
                self.activityIndicator.stopAnimating()
                self.activityIndicator.removeFromSuperview()
                UserDefaults.standard.removeObject(forKey: "userGroup")
                print("Был удален аккаунт. UserDefaults: \(String(describing: UserDefaults.standard.string(forKey: "userGroup")))")
            case .failure(let error):
                self.present(self.presenter.showAlert(title: "Ошибка", message: "\(error.localizedDescription)"), animated: true)
                self.activityIndicator.stopAnimating()
                self.activityIndicator.removeFromSuperview()
            }
        }
    }
    
    // EXIT ACCOUNT:
    func exitAccount() {
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        presenter.exitUser { result in
            switch result {
            case .success:
                self.present(self.presenter.showAlert(title: "Успешно", message: "Вы вышли из аккаунта"), animated: true)
                UserDefaults.standard.removeObject(forKey: "userGroup")
                print("Был выполнен выход из учетной записи. UserDefaults: \(String(describing: UserDefaults.standard.string(forKey: "userGroup")))")
                self.activityIndicator.stopAnimating()
                self.activityIndicator.removeFromSuperview()
            case .failure(let error):
                self.present(self.presenter.showAlert(title: "Ошибка", message: "\(error.localizedDescription)"), animated: true)
                self.activityIndicator.stopAnimating()
                self.activityIndicator.removeFromSuperview()
            }
        }
    }
    
    // RESET PASSWORD:
    func resetPassword() {
        presenter.resetPassword(email: enterEmailTF.text ?? "")
    }
    
    // SUCCESS RESET PASSWORD:
    func successReset() {
        let alert = UIAlertController(title: "Успешно", message: "Форма для сброса пароля отправлена на указанный Email", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: { [weak self] _ in
            self?.dismissView()
        }))
        present(alert, animated: true)
    }
    
    // ERROR RESET PASSWORD:
    func errorReset(error: String) {
        let alert = UIAlertController(title: "Ошибка", message: "\(error).", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: { [weak self] _ in
            self?.dismissView()
        }))
        present(alert, animated: true)
    }
}

// MARK: - EXTENSIONS FOR PICKER VIEW DATA SOURSE:

extension AccountVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return RegistrationGroup.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return RegistrationGroup.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        registrationGroupTF.text = RegistrationGroup.allCases[row].rawValue
        view.endEditing(true)
    }
}
