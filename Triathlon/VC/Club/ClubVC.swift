import UIKit

// MARK: - protocol

protocol ClubVCProtocol: AnyObject {}

class ClubVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: ClubPresenterProtocol!
    
    private let loadingView = UIView()
    private let loadingImageView = UIImageView(image: UIImage(resource: .tristyleLogoWhite))
    
    private let scrollView = UIScrollView()
    private let logoImageView = UIImageView(image: UIImage(resource: .tristyleLogoWhite))
    
    private let coachCountLabel = UILabel()
    private let coachDescriptionLabel = UILabel()
    
    private let sportsmenCountLabel = UILabel()
    private let sportsmenDescriptionLabel = UILabel()
    
    private let startCountLabel = UILabel()
    private let startDescriptionLabel = UILabel()
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        animateCountLabel(label: coachCountLabel, to: 16, duration: 1.0)
        animateCountLabel(label: sportsmenCountLabel, to: 152, duration: 3)
        animateCountLabel(label: startCountLabel, to: 32, duration: 2)
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(logoImageView, scrollView, loadingView)
        loadingView.addSubviews(loadingImageView)
        scrollView.addSubviews(coachCountLabel, coachDescriptionLabel, sportsmenCountLabel, sportsmenDescriptionLabel, startCountLabel, startDescriptionLabel)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // LOADING VIEW:
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // LOADING IMAGE:
        loadingImageView.translatesAutoresizingMaskIntoConstraints = false
        loadingImageView.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        loadingImageView.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor).isActive = true
        loadingImageView.widthAnchor.constraint(equalTo: loadingView.widthAnchor, multiplier: 0.5).isActive = true
        loadingImageView.heightAnchor.constraint(equalTo: loadingImageView.widthAnchor, multiplier: 1).isActive = true
        
        // SCROLL VIEW:
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // IMAGE VIEW:
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1).isActive = true
        
        // COACH:
        coachCountLabel.translatesAutoresizingMaskIntoConstraints = false
        coachCountLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        coachCountLabel.trailingAnchor.constraint(equalTo: sportsmenCountLabel.leadingAnchor, constant: -25).isActive = true
        
        coachDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        coachDescriptionLabel.topAnchor.constraint(equalTo: coachCountLabel.bottomAnchor).isActive = true
        coachDescriptionLabel.centerXAnchor.constraint(equalTo: coachCountLabel.centerXAnchor).isActive = true
        
        // SPORTSMEN:
        sportsmenCountLabel.translatesAutoresizingMaskIntoConstraints = false
        sportsmenCountLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        sportsmenCountLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        sportsmenDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        sportsmenDescriptionLabel.topAnchor.constraint(equalTo: sportsmenCountLabel.bottomAnchor).isActive = true
        sportsmenDescriptionLabel.centerXAnchor.constraint(equalTo: sportsmenCountLabel.centerXAnchor).isActive = true
        
        // START:
        startCountLabel.translatesAutoresizingMaskIntoConstraints = false
        startCountLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        startCountLabel.leadingAnchor.constraint(equalTo: sportsmenCountLabel.trailingAnchor, constant: 25).isActive = true
        
        startDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        startDescriptionLabel.topAnchor.constraint(equalTo: startCountLabel.bottomAnchor).isActive = true
        startDescriptionLabel.centerXAnchor.constraint(equalTo: startCountLabel.centerXAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // LOADING VIEW:
        loadingView.backgroundColor = .colorMainBlue
        perform(#selector(closeAnimationVIew), with: nil, afterDelay: 0)
        
        // VIEW:
        view.backgroundColor = .colorTabBar
        
        // NAVIGATION CONTROLLER:
        navigationItem.title = ""
        navigationController?.navigationBar.isHidden = true
        
        // TAB BAR:
        tabBarController?.tabBar.isHidden = true
        
        // SCROLL VIEW:
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        scrollView.isScrollEnabled = true

        // IMAGE VIEW:
        logoImageView.contentMode = .scaleAspectFit
        
        // COACH:
        coachCountLabel.textColor = .white
        coachCountLabel.font = fontBoldStandard64
        coachCountLabel.text = "16"
        
        coachDescriptionLabel.textColor = .white
        coachDescriptionLabel.font = fontLightStandard12
        coachDescriptionLabel.text = "Тренеров"
        
        // SPORTSMEN:
        sportsmenCountLabel.textColor = .white
        sportsmenCountLabel.font = fontBoldStandard64
        sportsmenCountLabel.text = "152"
        
        sportsmenDescriptionLabel.textColor = .white
        sportsmenDescriptionLabel.font = fontLightStandard12
        sportsmenDescriptionLabel.text = "Спортсменов"
        
        // START:
        startCountLabel.textColor = .white
        startCountLabel.font = fontBoldStandard64
        startCountLabel.text = "32"
        
        startDescriptionLabel.textColor = .white
        startDescriptionLabel.font = fontLightStandard12
        startDescriptionLabel.text = "Стартов"
    }
    
    // MARK: - HELPERS:
    
    // CLOSED ANIMATION VIEW:
    @objc private func closeAnimationVIew() {
        tabBarController?.tabBar.isHidden = false
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.loadingView.alpha = 0.0
        }, completion: { _ in
            self.loadingView.removeFromSuperview()
        })
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
    @objc private func updateLabel(_ displayLink: CADisplayLink) {
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

// MARK: - EXTENSION:

extension ClubVC: ClubVCProtocol {}

private var startValueKey: UInt8 = 0
private var endValueKey: UInt8 = 0
private var animationStartDateKey: UInt8 = 0
private var animationDurationKey: UInt8 = 0
