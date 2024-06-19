import UIKit

// MARK: - PROTOCOL:

protocol ClubPresenterProtocol {
    func animateCountLabel(label: UILabel, to endValue: Int, duration: Double)
    func linkButtonTapped() -> UIAlertController
    func infoButtonTapped() -> UIAlertController
    func showAlertCompany(title: String, message: String)
    func showAlertDeveloper(title: String, message: String)
    func fbButtonTapped()
    func instagramButtonTapped()
    func youtubeButtonTapped()
    func telegramButtonTapped()
    func webButtonTapped()
    func phoneButtonTapped()
    func emailButtonTapped()
    func writeButtonTapped()
}

final class ClubPresenter: ClubPresenterProtocol {
    // MARK: - PROPERTIES:

    unowned let view: ClubVCProtocol
    private let vibration = Vibration()
    private var startValueKey: UInt8 = 0
    private var endValueKey: UInt8 = 0
    private var animationStartDateKey: UInt8 = 0
    private var animationDurationKey: UInt8 = 0
    private var buildVersion = ""
    private var appVersion = ""
    
    // MARK: - INIT:

    init(view: ClubVCProtocol) {
        self.view = view
    }
    
    // MARK: - METHODS:
    
    // ANIMATE COUNT LABELS:
    func animateCountLabel(label: UILabel, to endValue: Int, duration: Double) {
        let animationStartDate = Date()
        let animationDuration: Double = duration
        let displayLink = CADisplayLink(target: self, selector: #selector(updateLabel))
        displayLink.add(to: .current, forMode: .default)
        displayLink.preferredFramesPerSecond = 60
        objc_setAssociatedObject(displayLink, &startValueKey, label, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(displayLink, &endValueKey, endValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(displayLink, &animationStartDateKey, animationStartDate, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(displayLink, &animationDurationKey, animationDuration, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    // UPDATE COUNT LABELS:
    @objc func updateLabel(_ displayLink: CADisplayLink) {
        guard let label = objc_getAssociatedObject(displayLink, &startValueKey) as? UILabel else { return }
        let endValue = objc_getAssociatedObject(displayLink, &endValueKey) as! Int
        let animationStartDate = objc_getAssociatedObject(displayLink, &animationStartDateKey) as! Date
        let animationDuration = objc_getAssociatedObject(displayLink, &animationDurationKey) as! Double
        let now = Date()
        let elapsedTime = now.timeIntervalSince(animationStartDate)
        let percentage = min(elapsedTime / animationDuration, 1)
        let newValue = Int(Double(endValue) * percentage)
        label.text = "\(newValue)"
        
        if percentage == 1 {
            displayLink.invalidate()
        }
    }
    
    // LINK BUTTON TAPPED:
    func linkButtonTapped() -> UIAlertController {
        let alert = UIAlertController(title: "Tristyle", message: "Клуб триатлона и циклических видов спорта", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Написать менеджеру", style: .default, handler: { [weak self] _ in
            self?.writeButtonTapped()
        }))
        alert.addAction(UIAlertAction(title: "Позвонить менеджеру", style: .default, handler: { [weak self] _ in
            self?.phoneButtonTapped()
        }))
        alert.addAction(UIAlertAction(title: "Сайт", style: .default, handler: { [weak self] _ in
            self?.webButtonTapped()
        }))
        alert.addAction(UIAlertAction(title: "Instagram", style: .default, handler: { [weak self] _ in
            self?.instagramButtonTapped()
        }))
        alert.addAction(UIAlertAction(title: "Telegram", style: .default, handler: { [weak self] _ in
            self?.telegramButtonTapped()
        }))
        alert.addAction(UIAlertAction(title: "YouTube", style: .default, handler: { [weak self] _ in
            self?.youtubeButtonTapped()
        }))
        alert.addAction(UIAlertAction(title: "Facebook", style: .default, handler: { [weak self] _ in
            self?.fbButtonTapped()
        }))
        alert.addAction(UIAlertAction(title: "Отправить Email", style: .default, handler: { [weak self] _ in
            self?.emailButtonTapped()
        }))
        alert.addAction(UIAlertAction(title: "Закрыть", style: .destructive, handler: nil))
        return alert
    }
    
    // INFO BUTTON TAPPED:
    func infoButtonTapped() -> UIAlertController {
        if let infoDictionary = Bundle.main.infoDictionary {
            if let buildVersion = infoDictionary["CFBundleVersion"] as? String {
                self.buildVersion = buildVersion
            }
            if let appVersion = infoDictionary["CFBundleShortVersionString"] as? String {
                self.appVersion = appVersion
            }
        }
        
        let alert = UIAlertController(title: "Tristyle", message: "Клуб триатлона и циклических видов спорта", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Личный кабинет", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            let accountVC = AccountVC()
            let accountPresenter = AccountPresenter(view: accountVC)
            accountVC.presenter = accountPresenter
            self.view.navigateAccountVC(view: accountVC)
        }))
        alert.addAction(UIAlertAction(title: "Договор оферты", style: .default, handler: { _ in
            if let url = URL(string: "https://google.com"), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Cannot open the URL.")
            }
        }))
        alert.addAction(UIAlertAction(title: "Политика конфидециальности", style: .default, handler: { _ in
            if let url = URL(string: "https://google.com"), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Cannot open the URL.")
            }
        }))
        alert.addAction(UIAlertAction(title: "Контакты", style: .default, handler: { _ in
            self.showAlertCompany(title: "Tristyle", message: """
            ИП Плодунов З.С.
            УНП 192599598
            Адрес: 220055, Республика Беларусь, Минск, ул. Неманская, д.73, офис 33
            Свидетельство о государственной регистрации № 0604206 от 04.02.2016 выдано Минским
            горисполкомом
            """)
        }))
        alert.addAction(UIAlertAction(title: "О приложении", style: .default, handler: { _ in
            self.showAlertDeveloper(title: "SwiftyLab™", message: "Версия приложения: \(self.appVersion)\nВерсия сборки:\(self.buildVersion)\n©Malyshew Andrew")
        }))
        alert.addAction(UIAlertAction(title: "Закрыть", style: .destructive, handler: nil))
        return alert
    }
    
    // SHOW ALERT COMPANY:
    func showAlertCompany(title: String, message: String) {
        guard let viewController = view as? UIViewController else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Связаться", style: .default, handler: { _ in
            let appURL = URL(string: "tg://resolve?domain=artodocx")
            let webURL = URL(string: "https://t.me/artodocx")
            guard let appURL = appURL else { return }
            if UIApplication.shared.canOpenURL(appURL) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            } else {
                guard let webURL = webURL else { return }
                UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "Закрыть", style: .destructive))
        viewController.present(alert, animated: true)
    }
    
    // SHOW ALERT DEVELOPER:
    func showAlertDeveloper(title: String, message: String) {
        guard let viewController = view as? UIViewController else { return }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Связаться", style: .default, handler: { _ in
            let appURL = URL(string: "tg://resolve?domain=malyshewandrew")
            let webURL = URL(string: "https://t.me/malyshewandrew")
            guard let appURL = appURL else { return }
            if UIApplication.shared.canOpenURL(appURL) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            } else {
                guard let webURL = webURL else { return }
                UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "Закрыть", style: .destructive))
        viewController.present(alert, animated: true)
    }
    
    // FB BUTTON TAPPED:
    func fbButtonTapped() {
        let appURL = URL(string: "https://www.facebook.com/tristyletrainer/")
        let webURL = URL(string: "https://www.facebook.com/tristyletrainer/")
        guard let appURL = appURL else { return }
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            guard let webURL = webURL else { return }
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
    
    // INSTAGRAM BUTTON TAPPED:
    func instagramButtonTapped() {
        let appURL = URL(string: "instagram://user?username=tristyletrainer")
        let webURL = URL(string: "https://instagram.com/tristyletrainer")
        guard let appURL = appURL else { return }
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            guard let webURL = webURL else { return }
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
    
    // YOUTUBE BUTTON TAPPED:
    func youtubeButtonTapped() {
        let appURL = URL(string: "https://www.youtube.com/@tristyleteam")
        let webURL = URL(string: "https://www.youtube.com/@tristyleteam")
        guard let appURL = appURL else { return }
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            guard let webURL = webURL else { return }
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
    
    // TELEGRAM BUTTON TAPPED:
    func telegramButtonTapped() {
        let appURL = URL(string: "tg://resolve?domain=tristyle")
        let webURL = URL(string: "https://t.me/s/tristyle")
        guard let appURL = appURL else { return }
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            guard let webURL = webURL else { return }
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
    
    // WEB BUTTON TAPPED:
    func webButtonTapped() {
        if let url = URL(string: "https://tristyle.by/"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("Cannot open the URL.")
        }
    }
    
    // PHONE BUTTON TAPPED:
    func phoneButtonTapped() {
        if let phoneURL = URL(string: "tel://+375291556161"),
           UIApplication.shared.canOpenURL(phoneURL)
        {
            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        } else {
            print("Cannot make a phone call.")
        }
    }
    
    // EMAIL BUTTON TAPPED:
    func emailButtonTapped() {
        let email = "tristyletrainer@gmail.com"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
    
    // WRITE BUTTON TAPPED:
    func writeButtonTapped() {
        let appURL = URL(string: "tg://resolve?domain=Tristyleteam")
        let webURL = URL(string: "https://t.me/Tristyleteam")
        guard let appURL = appURL else { return }
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            guard let webURL = webURL else { return }
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
}
