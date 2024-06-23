import UIKit
import WebKit

final class DetailPeopleVC: UIViewController {
    // MARK: - PROPERTIES:
    private let backgroundImage = UIImageView()
    private let youtubeWebView = WKWebView()
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(backgroundImage, youtubeWebView)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // BACKGROUND VIEW:
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // WEB VIEW:
        youtubeWebView.translatesAutoresizingMaskIntoConstraints = false
        youtubeWebView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        youtubeWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        youtubeWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        youtubeWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // BACKGROUND VIEW:
        backgroundImage.image = UIImage(resource: .background)
        
        // WEB VIEW:
        youtubeWebView.layer.masksToBounds = true
        youtubeWebView.layer.cornerRadius = cornerRadius
    }
    
    // MARK: - HELPERS:

    func configure(model: HumanModel) {
        if let url = URL(string: model.youtube) {
            youtubeWebView.load(URLRequest(url: url))
        }
    }
}

// MARK: - EXTENSIONS:
