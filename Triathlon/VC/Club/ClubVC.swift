import UIKit

// MARK: - protocol
protocol ClubVCProtocol: AnyObject {
    
}

class ClubVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: ClubPresenterProtocol!
    
    private let loadingView = UIView()
    private let tristyleLogoImageView = UIImageView(image: UIImage(resource: .tristyleLogo))
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(loadingView)
        loadingView.addSubviews(tristyleLogoImageView)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // LOADING VIEW:
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // TRISTYLE LOGO:
        tristyleLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        tristyleLogoImageView.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor).isActive = true
        tristyleLogoImageView.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor).isActive = true
        tristyleLogoImageView.widthAnchor.constraint(equalTo: loadingView.widthAnchor, multiplier: 0.5).isActive = true
        tristyleLogoImageView.heightAnchor.constraint(equalTo: tristyleLogoImageView.widthAnchor, multiplier: 1).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        
        // LOADING VIEW:
        loadingView.backgroundColor = .colorMainBlue
        perform(#selector(closeAnimationVIew), with: nil, afterDelay: 3)
        
        // VIEW:
        view.backgroundColor = .colorBackground
        
        // NAVIGATION CONTROLLER:
        navigationItem.title = ""
        
        // TAB BAR:
        tabBarController?.tabBar.isHidden = true
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
}

// MARK: - EXTENSION:
extension ClubVC: ClubVCProtocol {
    
}
