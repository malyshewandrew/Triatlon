import Lottie
import PDFKit
import UIKit
import WebKit

// MARK: - PROTOCOL:

protocol ClubVCProtocol: AnyObject {
    
}

final class ClubVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: ClubPresenterProtocol!
    private let loadingView = UIView()
    private let loadingImageView = UIImageView(image: UIImage(resource: .tristyleLogoWhite))
    private let loadingLottie = LottieAnimationView(name: "LoadingLottie")
    private let backgroundImage = UIImageView()
    private let linkButton = UIButton(type: .system)
    private let infoButton = UIButton(type: .system)
    private let configurationImage = UIImage.SymbolConfiguration(pointSize: 25)
    private let logoImageView = UIImageView(image: UIImage(resource: .tristyleLogoWhite))
    private let coachCountLabel = UILabel()
    private let coachDescriptionLabel = UILabel()
    private let sportsmenCountLabel = UILabel()
    private let sportsmenDescriptionLabel = UILabel()
    private let startCountLabel = UILabel()
    private let startDescriptionLabel = UILabel()
    private let codexButton = UIButton(type: .system)
    private let philosophyButton = UIButton(type: .system)
    private let medecineButton = UIButton(type: .system)
    private var currentLottie: LottieAnimationView?
    private var animationTimer: Timer?
    private var showTimer: Timer?
    private let vibration = Vibration()
    
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
        view.addSubviews(backgroundImage, linkButton, infoButton, logoImageView, coachCountLabel, coachDescriptionLabel, sportsmenCountLabel, sportsmenDescriptionLabel, startCountLabel, startDescriptionLabel, codexButton, philosophyButton, medecineButton, loadingView)
        loadingView.addSubviews(loadingImageView, loadingLottie)
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
        loadingImageView.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor, constant: -50).isActive = true
        loadingImageView.widthAnchor.constraint(equalTo: loadingView.widthAnchor, multiplier: 0.5).isActive = true
        loadingImageView.heightAnchor.constraint(equalTo: loadingImageView.widthAnchor, multiplier: 1).isActive = true
        
        // LOADING LOTTIE:
        loadingLottie.translatesAutoresizingMaskIntoConstraints = false
        loadingLottie.centerXAnchor.constraint(equalTo: loadingImageView.centerXAnchor).isActive = true
        loadingLottie.centerYAnchor.constraint(equalTo: loadingImageView.centerYAnchor, constant: 125).isActive = true
        loadingLottie.widthAnchor.constraint(equalTo: loadingView.widthAnchor, multiplier: 0.3).isActive = true
        loadingLottie.heightAnchor.constraint(equalTo: loadingView.widthAnchor, multiplier: 1).isActive = true
        
        // BACKGROUND VIEW:
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // LINK BUTTON:
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        linkButton.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: -20).isActive = true
        linkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        linkButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        linkButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        // INFO BUTTON:
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: -20).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // IMAGE VIEW:
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
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
        medecineButton.translatesAutoresizingMaskIntoConstraints = false
        medecineButton.topAnchor.constraint(equalTo: philosophyButton.bottomAnchor, constant: 25).isActive = true
        medecineButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        medecineButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        medecineButton.heightAnchor.constraint(equalTo: codexButton.widthAnchor, multiplier: 0.2).isActive = true
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
        
        // BACKGROUND VIEW:
        backgroundImage.image = UIImage(resource: .background)
        
        // LINK BUTTON:
        linkButton.setImage(UIImage(systemName: "link.circle.fill", withConfiguration: configurationImage), for: .normal)
        linkButton.tintColor = .white
        linkButton.addTarget(self, action: #selector(linkButtonTapped), for: .touchUpInside)
        
        // INFO BUTTON:
        infoButton.setImage(UIImage(systemName: "info.circle.fill", withConfiguration: configurationImage), for: .normal)
        infoButton.tintColor = .white
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)

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
            self?.vibration.vibrationStandart()
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
            self?.vibration.vibrationStandart()
            let philosophyVC = PhilosophyVC()
            self?.present(philosophyVC, animated: true)
        }), for: .touchUpInside)
        
        // JOIN BUTTON:
        medecineButton.setTitle("Медицина", for: .normal)
        medecineButton.setTitleColor(.white, for: .normal)
        medecineButton.layer.masksToBounds = true
        medecineButton.layer.cornerRadius = cornerRadius
        medecineButton.layer.borderWidth = 2
        medecineButton.layer.borderColor = UIColor(white: 1, alpha: 1).cgColor
        medecineButton.addAction(UIAction(handler: { [weak self] _ in
            self?.vibration.vibrationStandart()
            let medecineVC = MedecineVC()
            self?.present(medecineVC, animated: true)
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
    
    // LINK BUTTON TAPPED:
    @objc private func linkButtonTapped() {
        vibration.vibrationStandart()
        present(presenter.linkButtonTapped(), animated: true)
    }
    
    // INFO BUTTON TAPPED:
    @objc private func infoButtonTapped() {
        vibration.vibrationStandart()
        present(presenter.infoButtonTapped(), animated: true)
    }
}

// MARK: - EXTENSION:

extension ClubVC: ClubVCProtocol {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
