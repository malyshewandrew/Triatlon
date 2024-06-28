import UIKit

protocol AnonimVCProtocol: AnyObject {
    func clearTextView()
    func showAlert(alert: UIAlertController)
    func gestureDone()
}

final class AnonimVC: UIViewController {
    // MARK: - PROPERTIES:

    var presenter: AnonimPresenterProtocol!
    private let backgroundImage = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let anonimTextView = UITextView()
    private let sendButton = UIButton(type: .system)
    private let vibration = Vibration()
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        configureGestures()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(backgroundImage, titleLabel, descriptionLabel, anonimTextView, sendButton)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // BACKGROUND VIEW:
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // TITLE LABEL:
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        // DESCRIPTION LABEL:
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        // ANONIM TEXT VIEW:
        anonimTextView.translatesAutoresizingMaskIntoConstraints = false
        anonimTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 25).isActive = true
        anonimTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        anonimTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        anonimTextView.heightAnchor.constraint(equalTo: anonimTextView.widthAnchor, multiplier: 0.3).isActive = true
        
        // SEND BUTTON:
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.topAnchor.constraint(equalTo: anonimTextView.bottomAnchor, constant: 15).isActive = true
        sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        sendButton.heightAnchor.constraint(equalTo: sendButton.widthAnchor, multiplier: 0.2).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // BACKGROUND VIEW:
        backgroundImage.image = UIImage(resource: .background)
        
        // TITLE LABEL:
        titleLabel.textColor = .white
        titleLabel.font = fontBoldStandard32
        titleLabel.textAlignment = .center
        titleLabel.text = "Обратная связь"
        titleLabel.adjustsFontSizeToFitWidth = true
        
        // DESCRIPTION LABEL:
        descriptionLabel.textColor = .white
        descriptionLabel.font = fontMediumLight14
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "Мы ценим ваше мнение.\nОставьте анонимную обратную связь, чтобы помочь нам стать лучше. Ваши честные отзывы важны для нас."
        
        // ANONIM TEXT VIEW:
        anonimTextView.layer.masksToBounds = true
        anonimTextView.layer.cornerRadius = cornerRadius
        anonimTextView.layer.borderWidth = 0.6
        anonimTextView.layer.borderColor = UIColor.white.cgColor
        anonimTextView.textColor = .white
        anonimTextView.backgroundColor = .colorBackground
        
        // SEND BUTTON:
        sendButton.layer.masksToBounds = true
        sendButton.layer.cornerRadius = cornerRadius
        sendButton.setTitle("Отправить анонимно", for: .normal)
        sendButton.titleLabel?.adjustsFontSizeToFitWidth = true
        sendButton.setTitleColor(.white, for: .normal)
        sendButton.titleLabel?.font = fontMediumStandard14
        sendButton.backgroundColor = .systemGreen
        sendButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.vibration.vibrationStandart()
            self.presenter.sendButtonTapped(message: self.anonimTextView.text)
        }), for: .touchUpInside)
    }
    
    // MARK: - HELPERS:
    
    // TAP ON FREE SPACE FOR CLOSE ALL VIEWS:
    private func configureGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        view.addGestureRecognizer(tapGesture)
    }
    
    // TAP ON FREE SPACE FOR CLOSE ALL VIEWS ACTION:
    @objc private func tapGestureDone() {
        view.endEditing(true)
    }
}

// MARK: - EXTENSIONS:

extension AnonimVC: AnonimVCProtocol {
    // CLEAR TEXT FIELD:
    func clearTextView() {
        anonimTextView.text = ""
    }
    
    // SHOW ALERT:
    func showAlert(alert: UIAlertController) {
        present(alert, animated: true)
    }
    
    // GESTURE DONE:
    func gestureDone() {
        view.endEditing(true)
    }
}
