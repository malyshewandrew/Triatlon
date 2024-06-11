import UIKit

// MARK: - protocol

protocol ClubPresenterProtocol {
    func animateCountLabel(label: UILabel, to endValue: Int, duration: Double)
    func codexButtonTapped()
    func joinButtonTapped()
    func instagramButtonTapped()
    func youtubeButtonTapped()
    func telegramButtonTapped()
    func webButtonTapped()
    func phoneButtonTapped()
}

final class ClubPresenter: ClubPresenterProtocol {
    unowned let view: ClubVCProtocol
    private let vibration = Vibration()
    
    private var startValueKey: UInt8 = 0
    private var endValueKey: UInt8 = 0
    private var animationStartDateKey: UInt8 = 0
    private var animationDurationKey: UInt8 = 0
    
    init(view: ClubVCProtocol) {
        self.view = view
    }
    
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
    
    // CODEX BUTTON TAPPED:
    func codexButtonTapped() {
        
    }
    
    // JOIN BUTTON TAPPED:
    func joinButtonTapped() {
        vibration.vibrationStandart()
        if let url = URL(string: "https://smart.tristyle.by/group?utm_source=cite"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("Cannot open the URL.")
        }
    }
    
    // INSTAGRAM BUTTON TAPPED:
    func instagramButtonTapped() {
        vibration.vibrationStandart()
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
        vibration.vibrationStandart()
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
        vibration.vibrationStandart()
        let appURL = URL(string: "tg://resolve?domain=tristyle")
        let webURL = URL(string: "https://t.me/tristyle")
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
        vibration.vibrationStandart()
        if let url = URL(string: "https://tristyle.by/"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("Cannot open the URL.")
        }
    }
    
    // PHONE BUTTON TAPPED:
    func phoneButtonTapped() {
        vibration.vibrationStandart()
        if let phoneURL = URL(string: "tel://+375291556161"),
           UIApplication.shared.canOpenURL(phoneURL)
        {
            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        } else {
            print("Cannot make a phone call.")
        }
    }
}
