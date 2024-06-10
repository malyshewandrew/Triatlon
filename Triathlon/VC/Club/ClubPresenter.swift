import UIKit

// MARK: - protocol
protocol ClubPresenterProtocol {
    func animateCountLabel(label: UILabel, to endValue: Int, duration: Double)
}

final class ClubPresenter: ClubPresenterProtocol {
    
    unowned let view: ClubVCProtocol
    
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
}
