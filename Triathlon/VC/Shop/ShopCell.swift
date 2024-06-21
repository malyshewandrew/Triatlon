import UIKit

final class ShopCell: UITableViewCell {
    // MARK: - PROPERTIES:

    private let containerView = UIView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let viewImageView = UIView()
    private let photoView = UIImageView()
    private let priceLabel = UILabel()
    private let buyButton = UIButton(type: .system)
    private var productLink: String?
    var presenter: ShopPresenterProtocol!
    
    // MARK: - LIFECYCLE:

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureConstraints()
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        contentView.addSubviews(containerView)
        containerView.addSubviews(nameLabel, descriptionLabel, viewImageView, priceLabel, buyButton)
        viewImageView.addSubviews(photoView)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // CONTAINER VIEW:
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        // VIEW IMAGE VIEW:
        viewImageView.translatesAutoresizingMaskIntoConstraints = false
        viewImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        viewImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.45).isActive = true
        viewImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        viewImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        // PHOTO VIEW:
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.topAnchor.constraint(equalTo: viewImageView.topAnchor).isActive = true
        photoView.leadingAnchor.constraint(equalTo: viewImageView.leadingAnchor).isActive = true
        photoView.trailingAnchor.constraint(equalTo: viewImageView.trailingAnchor).isActive = true
        photoView.bottomAnchor.constraint(equalTo: viewImageView.bottomAnchor).isActive = true

        let aspectRatioConstraint = photoView.heightAnchor.constraint(equalTo: photoView.widthAnchor, multiplier: 3/4)
        aspectRatioConstraint.priority = .defaultHigh
        aspectRatioConstraint.isActive = true
        
        // NAME LABEL:
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: viewImageView.trailingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        // DESCRIPTION LABEL:
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: viewImageView.trailingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        // PRICE LABEL:
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: viewImageView.trailingAnchor, constant: 10).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -10).isActive = true
        
        // BUY BUTTON:
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        buyButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        buyButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        buyButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.2).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func configureUI() {
        // CONTENT VIEW:
        selectionStyle = .none
        contentView.backgroundColor = .clear
        
        // CONTAINER VIEW:
        containerView.backgroundColor = .colorBackground
        containerView.layer.cornerRadius = cornerRadius
        
        // PHOTO VIEW:
        photoView.layer.masksToBounds = true
        photoView.layer.cornerRadius = cornerRadius
        photoView.contentMode = .scaleAspectFill
        photoView.clipsToBounds = true
        
        // NAME LABEL:
        nameLabel.textColor = .systemBlue
        nameLabel.font = fontBoldStandard22
        nameLabel.adjustsFontSizeToFitWidth = true
        
        // DESCRIPTION:
        descriptionLabel.textColor = .white
        descriptionLabel.font = fontLightStandard10
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontSizeToFitWidth = true
        
        // PRICE LABEL:
        priceLabel.textColor = .systemOrange
        priceLabel.font = fontBoldStandard22
        priceLabel.adjustsFontSizeToFitWidth = true
        
        // BUY BUTTON:
        buyButton.setTitle("Купить", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.titleLabel?.font = fontMediumStandard14
        buyButton.titleLabel?.adjustsFontSizeToFitWidth = true
        buyButton.layer.masksToBounds = true
        buyButton.layer.cornerRadius = cornerRadius
        buyButton.backgroundColor = .systemBlue
        buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
    }

    
    // MARK: - HELPERS:
    
    // CONFIGURE:
    func configure(product: ProductModel) {
        photoView.image = product.photo
        nameLabel.text = product.name
        descriptionLabel.text = product.description
        priceLabel.text = product.price
        productLink = product.link
    }
    
    // BUY BUTTON TAPPED:
    @objc func buyButtonTapped() {
        presenter.shopButtonTapped(with: productLink)
    }
}
