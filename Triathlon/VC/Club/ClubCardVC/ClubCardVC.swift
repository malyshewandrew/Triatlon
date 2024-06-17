import UIKit

final class ClubCardVC: UIViewController {
    
    // MARK: - PROPERTIES:
    private let backgroundImage = UIImageView()
    private let clubCardImage = UIImageView()
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(backgroundImage, clubCardImage)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // BACKGROUND VIEW:
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // CLUB CARD IMAGE:
        clubCardImage.translatesAutoresizingMaskIntoConstraints = false
        clubCardImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        clubCardImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        clubCardImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        clubCardImage.heightAnchor.constraint(equalTo: clubCardImage.widthAnchor, multiplier: 0.35).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // BACKGROUND VIEW:
        backgroundImage.image = UIImage(resource: .background)
        
        // CLUB CARD IMAGE:
        clubCardImage.image = UIImage(resource: .clubCard)
        clubCardImage.contentMode = .scaleAspectFill
    }
    
    // MARK: - HELPERS:
    
}

// MARK: - EXTENSIONS:
