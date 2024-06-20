import UIKit

final class PartnerCell: UITableViewCell {
    // MARK: - PROPERTIES:

    private let containerView = UIView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let percentLabel = UILabel()
    private let webButton = UIButton(type: .system)
    private let contactLabel = UILabel()
    private var webLink: String?
    var presenter: ClubCardPresenterProtocol!
    
    // MARK: - LIFYCYCLE:

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureConstreints()
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ADD SUBVIEW:

    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubviews(nameLabel, descriptionLabel, percentLabel, webButton, contactLabel)
    }
    
    // MARK: - CONFIGURE CONSTREINTS:

    private func configureConstreints() {
        // CONTAINER VIEW:
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
        // NAME LABEL:
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.80).isActive = true
        
        // DESCRIPTION LABEL:
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.85).isActive = true
        
        // PERCENT LABEL:
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        percentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
        percentLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.15).isActive = true
        
        // WEB BUTTON:
        webButton.translatesAutoresizingMaskIntoConstraints = false
        webButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        webButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        webButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.2).isActive = true
        webButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        
        // CONTACT LABEL:
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        contactLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        contactLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
        contactLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.45).isActive = true
        contactLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
    }
    
    // MARK: - CONFIGURE UI:

    private func configureUI() {
        // CONTENT VIEW:
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        // CONTAINER VIEW:
        containerView.backgroundColor = .colorBackground
        containerView.layer.cornerRadius = cornerRadius
        
        // NAME LABEL:
        nameLabel.textColor = .systemBlue
        nameLabel.textAlignment = .left
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = fontBoldStandard32
        
        // DESCRIPTION LABEL:
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .left
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.font = fontMediumLight14
        descriptionLabel.numberOfLines = 0
        
        // PERCENT LABEL:
        percentLabel.textColor = .systemOrange
        percentLabel.textAlignment = .right
        percentLabel.adjustsFontSizeToFitWidth = true
        percentLabel.font = fontBoldStandard32
        
        // WEB LABEL:
        webButton.setTitleColor(.white, for: .normal)
        webButton.titleLabel?.textAlignment = .left
        webButton.titleLabel?.adjustsFontSizeToFitWidth = true
        webButton.titleLabel?.font = fontMediumStandard14
        webButton.layer.masksToBounds = true
        webButton.layer.cornerRadius = cornerRadius
        webButton.setTitle("Сайт", for: .normal)
        webButton.backgroundColor = .systemGreen
        webButton.addTarget(self, action: #selector(webButtonTapped), for: .touchUpInside)
        
        // CONTACT LABEL:
        contactLabel.textColor = .white
        contactLabel.textAlignment = .right
        contactLabel.adjustsFontSizeToFitWidth = true
        contactLabel.font = fontMediumStandard14
    }

    // MARK: - HELPERS:
    
    // CONFIGURE:
    func configure(with discont: DiscountModel) {
        nameLabel.text = discont.name
        descriptionLabel.text = discont.description
        percentLabel.text = discont.percent
        contactLabel.text = discont.contact
        webLink = discont.web
    }
    
    // MARK: - HELPERS:
    
    // WEB BUTTON TAPPED:
    @objc func webButtonTapped() {
        guard let presenter = presenter else {
            print("Presenter is nil")
            return
        }
        presenter.webButtonTapped(with: webLink)
    }
}

// MARK: - EXTENSION:
