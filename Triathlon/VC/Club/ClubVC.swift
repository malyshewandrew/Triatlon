import PDFKit
import UIKit
import WebKit
import Lottie

// MARK: - protocol

protocol ClubVCProtocol: AnyObject {}

class ClubVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: ClubPresenterProtocol!
    private let loadingView = UIView()
    private let loadingImageView = UIImageView(image: UIImage(resource: .tristyleLogoWhite))
    private let loadingLottie = LottieAnimationView(name: "LoadingLottie")
    
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
    
    private let linksView = UIView()
    private let instagramButton = UIButton(type: .system)
    private let youtubeButton = UIButton(type: .system)
    private let telegramButton = UIButton(type: .system)
    private let phoneButton = UIButton(type: .system)
    private let webButton = UIButton(type: .system)
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        UserDefaults.standard.setValue(true, forKey: "FirstOpen")
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(logoImageView, coachCountLabel, coachDescriptionLabel, sportsmenCountLabel, sportsmenDescriptionLabel, startCountLabel, startDescriptionLabel, codexButton, philosophyButton, joinButton, linksView, loadingView)
        loadingView.addSubviews(loadingImageView, loadingLottie)
        linksView.addSubviews(instagramButton, telegramButton, youtubeButton, phoneButton, webButton)
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
        
        // LOADING LOTTIE:
        loadingLottie.translatesAutoresizingMaskIntoConstraints = false
        loadingLottie.centerXAnchor.constraint(equalTo: loadingImageView.centerXAnchor).isActive = true
        loadingLottie.centerYAnchor.constraint(equalTo: loadingImageView.centerYAnchor, constant: 125).isActive = true
        loadingLottie.widthAnchor.constraint(equalTo: loadingView.widthAnchor, multiplier: 0.3).isActive = true
        loadingLottie.heightAnchor.constraint(equalTo: loadingView.widthAnchor, multiplier: 1).isActive = true
        
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
        
        // LINKS VIEW:
        linksView.translatesAutoresizingMaskIntoConstraints = false
        linksView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        linksView.topAnchor.constraint(equalTo: joinButton.bottomAnchor, constant: 50).isActive = true
        linksView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        linksView.heightAnchor.constraint(equalTo: linksView.widthAnchor, multiplier: 0.2).isActive = true
        
        // INSTAGRAM:
        instagramButton.translatesAutoresizingMaskIntoConstraints = false
        instagramButton.centerXAnchor.constraint(equalTo: linksView.centerXAnchor).isActive = true
        instagramButton.centerYAnchor.constraint(equalTo: linksView.centerYAnchor).isActive = true
        instagramButton.heightAnchor.constraint(equalTo: linksView.heightAnchor, multiplier: 0.5).isActive = true
        instagramButton.widthAnchor.constraint(equalTo: instagramButton.heightAnchor, multiplier: 1).isActive = true
        
        // YOUTUBE:
        youtubeButton.translatesAutoresizingMaskIntoConstraints = false
        youtubeButton.trailingAnchor.constraint(equalTo: instagramButton.leadingAnchor, constant: -30).isActive = true
        youtubeButton.centerYAnchor.constraint(equalTo: linksView.centerYAnchor).isActive = true
        youtubeButton.heightAnchor.constraint(equalTo: linksView.heightAnchor, multiplier: 0.5).isActive = true
        youtubeButton.widthAnchor.constraint(equalTo: youtubeButton.heightAnchor, multiplier: 1).isActive = true
        
        // TELEGRAM:
        telegramButton.translatesAutoresizingMaskIntoConstraints = false
        telegramButton.trailingAnchor.constraint(equalTo: youtubeButton.leadingAnchor, constant: -30).isActive = true
        telegramButton.centerYAnchor.constraint(equalTo: linksView.centerYAnchor).isActive = true
        telegramButton.heightAnchor.constraint(equalTo: linksView.heightAnchor, multiplier: 0.5).isActive = true
        telegramButton.widthAnchor.constraint(equalTo: telegramButton.heightAnchor, multiplier: 1).isActive = true
        
        // WEB:
        webButton.translatesAutoresizingMaskIntoConstraints = false
        webButton.leadingAnchor.constraint(equalTo: instagramButton.trailingAnchor, constant: 30).isActive = true
        webButton.centerYAnchor.constraint(equalTo: linksView.centerYAnchor).isActive = true
        webButton.heightAnchor.constraint(equalTo: linksView.heightAnchor, multiplier: 0.5).isActive = true
        webButton.widthAnchor.constraint(equalTo: webButton.heightAnchor, multiplier: 1).isActive = true
        
        // PHONE:
        phoneButton.translatesAutoresizingMaskIntoConstraints = false
        phoneButton.leadingAnchor.constraint(equalTo: webButton.trailingAnchor, constant: 30).isActive = true
        phoneButton.centerYAnchor.constraint(equalTo: linksView.centerYAnchor).isActive = true
        phoneButton.heightAnchor.constraint(equalTo: linksView.heightAnchor, multiplier: 0.5).isActive = true
        phoneButton.widthAnchor.constraint(equalTo: phoneButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // LOADING VIEW:
        loadingView.backgroundColor = .colorMain
        
        // LOADING LOTTTIE:
        loadingLottie.play()
        loadingLottie.loopMode = .loop
        
        perform(#selector(closeAnimationVIew), with: nil, afterDelay: 2)
        
        // VIEW:
        view.backgroundColor = .colorMain
        
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
        coachCountLabel.text = "   "
        
        coachDescriptionLabel.textColor = .white
        coachDescriptionLabel.font = fontLightStandard12
        coachDescriptionLabel.text = "Тренеров"
        
        // SPORTSMEN:
        sportsmenCountLabel.textColor = .white
        sportsmenCountLabel.font = fontBoldStandard64
        sportsmenCountLabel.text = "   "
        
        sportsmenDescriptionLabel.textColor = .white
        sportsmenDescriptionLabel.font = fontLightStandard12
        sportsmenDescriptionLabel.text = "Спортсменов"
        
        // START:
        startCountLabel.textColor = .white
        startCountLabel.font = fontBoldStandard64
        startCountLabel.text = "   "
        
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
        codexButton.addAction(UIAction(handler: { [weak self] _ in
            let codexVC = CodexVC()
            self?.present(codexVC, animated: true)
        }), for: .touchUpInside)
        
        // PHILOSOPHY BUTTON:
        philosophyButton.setTitle("Философия и ценности", for: .normal)
        philosophyButton.setTitleColor(.white, for: .normal)
        philosophyButton.layer.masksToBounds = true
        philosophyButton.layer.cornerRadius = cornerRadius
        philosophyButton.layer.borderWidth = 2
        philosophyButton.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        philosophyButton.addAction(UIAction(handler: { [weak self] _ in
            let philosophyVC = PhilosophyVC()
            self?.present(philosophyVC, animated: true)
        }), for: .touchUpInside)
        
        // JOIN BUTTON:
        joinButton.setTitle("Начать тренироваться", for: .normal)
        joinButton.setTitleColor(.white, for: .normal)
        joinButton.layer.masksToBounds = true
        joinButton.layer.cornerRadius = cornerRadius
        joinButton.layer.borderWidth = 2
        joinButton.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        joinButton.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter.joinButtonTapped()
        }), for: .touchUpInside)
        
        // LINKS VIEW:
        linksView.layer.cornerRadius = cornerRadius
        
        // INSTAGRAM:
        instagramButton.setImage(UIImage(resource: .instagram), for: .normal)
        instagramButton.tintColor = .white
        instagramButton.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter.instagramButtonTapped()
        }), for: .touchUpInside)
        
        // YOUTUBE:
        youtubeButton.setImage(UIImage(resource: .youTube), for: .normal)
        youtubeButton.tintColor = .white
        youtubeButton.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter.youtubeButtonTapped()
        }), for: .touchUpInside)
        
        // TELEGRAM:
        telegramButton.setImage(UIImage(resource: .telegram), for: .normal)
        telegramButton.tintColor = .white
        telegramButton.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter.telegramButtonTapped()
        }), for: .touchUpInside)
        
        // WEB:
        webButton.setImage(UIImage(resource: .web), for: .normal)
        webButton.tintColor = .white
        webButton.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter.webButtonTapped()
        }), for: .touchUpInside)
        
        // PHONE:
        phoneButton.setImage(UIImage(resource: .phone), for: .normal)
        phoneButton.tintColor = .white
        phoneButton.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter.phoneButtonTapped()
        }), for: .touchUpInside)
    }
    
    // MARK: - HELPERS:
    
    // CLOSED ANIMATION VIEW:
    @objc private func closeAnimationVIew() {
        tabBarController?.tabBar.isHidden = false
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.loadingView.alpha = 0.0
        }, completion: { [weak self] _ in
            self?.loadingView.removeFromSuperview()
            self?.startAnimationForCountsLabel()
        })
    }
    
    // START ANIMATION FOR COUNTS LABEL:
    private func startAnimationForCountsLabel() {
        presenter.animateCountLabel(label: coachCountLabel, to: 16, duration: 0.5)
        presenter.animateCountLabel(label: sportsmenCountLabel, to: 152, duration: 1.5)
        presenter.animateCountLabel(label: startCountLabel, to: 32, duration: 1)
    }
}

// MARK: - EXTENSION:

extension ClubVC: ClubVCProtocol {}
