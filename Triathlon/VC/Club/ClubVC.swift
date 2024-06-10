import UIKit

// MARK: - protocol

protocol ClubVCProtocol: AnyObject {
    
}

class ClubVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: ClubPresenterProtocol!
    private let vibration = Vibration()
    private let loadingView = UIView()
    private let loadingImageView = UIImageView(image: UIImage(resource: .tristyleLogoWhite))
    private let logoImageView = UIImageView(image: UIImage(resource: .tristyleLogoWhite))
    private let coachCountLabel = UILabel()
    private let coachDescriptionLabel = UILabel()
    private let sportsmenCountLabel = UILabel()
    private let sportsmenDescriptionLabel = UILabel()
    private let startCountLabel = UILabel()
    private let startDescriptionLabel = UILabel()
    
    private let codexButton = UIButton(type: .system)
    private let philosophyButton = UIButton(type: .system)
    private let joinButton = UIButton(type: .system)
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        startAnimationForCountsLabel()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(logoImageView, loadingView, coachCountLabel, coachDescriptionLabel, sportsmenCountLabel, sportsmenDescriptionLabel, startCountLabel, startDescriptionLabel, codexButton, philosophyButton, joinButton)
        loadingView.addSubviews(loadingImageView)
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
        
        // IMAGE VIEW:
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 1).isActive = true
        
        // COACH:
        coachCountLabel.translatesAutoresizingMaskIntoConstraints = false
        coachCountLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20).isActive = true
        coachCountLabel.trailingAnchor.constraint(equalTo: sportsmenCountLabel.leadingAnchor, constant: -25).isActive = true
        
        coachDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        coachDescriptionLabel.topAnchor.constraint(equalTo: coachCountLabel.bottomAnchor).isActive = true
        coachDescriptionLabel.centerXAnchor.constraint(equalTo: coachCountLabel.centerXAnchor).isActive = true
        
        // SPORTSMEN:
        sportsmenCountLabel.translatesAutoresizingMaskIntoConstraints = false
        sportsmenCountLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20).isActive = true
        sportsmenCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        sportsmenDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        sportsmenDescriptionLabel.topAnchor.constraint(equalTo: sportsmenCountLabel.bottomAnchor).isActive = true
        sportsmenDescriptionLabel.centerXAnchor.constraint(equalTo: sportsmenCountLabel.centerXAnchor).isActive = true
        
        // START:
        startCountLabel.translatesAutoresizingMaskIntoConstraints = false
        startCountLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20).isActive = true
        startCountLabel.leadingAnchor.constraint(equalTo: sportsmenCountLabel.trailingAnchor, constant: 25).isActive = true
        
        startDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        startDescriptionLabel.topAnchor.constraint(equalTo: startCountLabel.bottomAnchor).isActive = true
        startDescriptionLabel.centerXAnchor.constraint(equalTo: startCountLabel.centerXAnchor).isActive = true
        
        // CODEX BUTTON:
        codexButton.translatesAutoresizingMaskIntoConstraints = false
        codexButton.topAnchor.constraint(equalTo: startDescriptionLabel.bottomAnchor, constant: 50).isActive = true
        codexButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        codexButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        codexButton.heightAnchor.constraint(equalTo: codexButton.widthAnchor, multiplier: 0.2).isActive = true
        
        // PHILOSOPHY BUTTON:
        philosophyButton.translatesAutoresizingMaskIntoConstraints = false
        philosophyButton.topAnchor.constraint(equalTo: codexButton.bottomAnchor, constant: 25).isActive = true
        philosophyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        philosophyButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        philosophyButton.heightAnchor.constraint(equalTo: codexButton.widthAnchor, multiplier: 0.2).isActive = true
        
        // JOIN BUTTON:
        joinButton.translatesAutoresizingMaskIntoConstraints = false
        joinButton.topAnchor.constraint(equalTo: philosophyButton.bottomAnchor, constant: 25).isActive = true
        joinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        joinButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        joinButton.heightAnchor.constraint(equalTo: codexButton.widthAnchor, multiplier: 0.2).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // LOADING VIEW:
        loadingView.backgroundColor = .colorMainBlue
        perform(#selector(closeAnimationVIew), with: nil, afterDelay: 3)
        
        // VIEW:
        view.backgroundColor = .colorTabBar
        
        // NAVIGATION CONTROLLER:
        navigationItem.title = ""
        navigationController?.navigationBar.isHidden = true
        
        // TAB BAR:
        tabBarController?.tabBar.isHidden = true

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
        
        // CODEX BUTTON:
        codexButton.setTitle("Кодекс клуба", for: .normal)
        codexButton.setTitleColor(.white, for: .normal)
        codexButton.layer.masksToBounds = true
        codexButton.layer.cornerRadius = cornerRadius
        codexButton.layer.borderWidth = 2
        codexButton.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        
        // PHILOSOPHY BUTTON:
        philosophyButton.setTitle("Философия и ценности", for: .normal)
        philosophyButton.setTitleColor(.white, for: .normal)
        philosophyButton.layer.masksToBounds = true
        philosophyButton.layer.cornerRadius = cornerRadius
        philosophyButton.layer.borderWidth = 2
        philosophyButton.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        
        // JOIN BUTTON:
        joinButton.setTitle("Начать тренироваться", for: .normal)
        joinButton.setTitleColor(.white, for: .normal)
        joinButton.layer.masksToBounds = true
        joinButton.layer.cornerRadius = cornerRadius
        joinButton.layer.borderWidth = 2
        joinButton.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
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
    
    // START ANIMATION FOR COUNTS LABEL:
    private func startAnimationForCountsLabel() {
        presenter.animateCountLabel(label: coachCountLabel, to: 16, duration: 1.0)
        presenter.animateCountLabel(label: sportsmenCountLabel, to: 152, duration: 3)
        presenter.animateCountLabel(label: startCountLabel, to: 32, duration: 2)
    }
}

// MARK: - EXTENSION:

extension ClubVC: ClubVCProtocol {
    
}
