import UIKit

// MARK: - PROTOCOL:

protocol ClubPresenterProtocol {
    func animateCountLabel(label: UILabel, to endValue: Int, duration: Double)
    func infoButtonTapped() -> UIAlertController
    func showAlert(title: String, message: String)
    func joinButtonTapped()
    func fbButtonTapped()
    func instagramButtonTapped()
    func youtubeButtonTapped()
    func telegramButtonTapped()
    func webButtonTapped()
    func phoneButtonTapped()
    func emailButtonTapped()
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
        alert.addAction(UIAlertAction(title: "Политика конфидециальности", style: .default, handler: { _ in
            if let url = URL(string: "https://google.com"), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Cannot open the URL.")
            }
        }))
        alert.addAction(UIAlertAction(title: "Условия использования", style: .default, handler: { _ in
            if let url = URL(string: "https://google.com"), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Cannot open the URL.")
            }
        }))
        alert.addAction(UIAlertAction(title: "О приложении", style: .default, handler: { _ in
            self.showAlert(title: "SwiftyLab™", message: "Версия приложения: \(self.appVersion)\nВерсия сборки:\(self.buildVersion)\n©Malyshew Andrew")
        }))
        alert.addAction(UIAlertAction(title: "Закрыть", style: .destructive, handler: nil))
        return alert
    }
    
    // SHOW ALERT:
    func showAlert(title: String, message: String) {
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
    
    // JOIN BUTTON TAPPED:
    func joinButtonTapped() {
        if let url = URL(string: "https://smart.tristyle.by/group?utm_source=cite"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("Cannot open the URL.")
        }
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
}
