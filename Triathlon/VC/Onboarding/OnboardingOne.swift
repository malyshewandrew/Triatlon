import AVFoundation
import UIKit

// MARK: - PROTOCOL:

protocol OnboardingVCProtocol: AnyObject {
    
}

final class OnboardingVC: UIViewController {
    // MARK: - PROPERTIES:
    var presenter: OnboardingPresenterProtocol!
    
    private let continueButton = UIButton(type: .system)
    
    // MARK: - LIFECYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        presenter.startVideo()
        startBouncingAnimation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(continueButton)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // CONTINUE:
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        continueButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        continueButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // CONTINUE:
        continueButton.setTitle("Продолжить", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.titleLabel?.font = fontBoldStandard16
        continueButton.layer.cornerRadius = cornerRadius
        continueButton.layer.masksToBounds = true
        continueButton.backgroundColor = .colorMain
        continueButton.layer.shadowRadius = 25
        continueButton.layer.shadowColor = UIColor.systemBlue.cgColor
        continueButton.layer.shadowOpacity = 1
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - HELPERS:

    // CONTINUE BUTTON TAPPED:
    @objc private func continueButtonTapped() {
        presenter.continueButtonTapped()
    }
    
    // START BOUNCE ANIMATION:
    private func startBouncingAnimation() {
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat, .allowUserInteraction], animations: {
            self.continueButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: nil)
    }
}

// MARK: - EXTENSION:
extension OnboardingVC: OnboardingVCProtocol {
}
