import UIKit

final class ShopCell: UITableViewCell {
    // MARK: - PROPERTIES:

    private let containerView = UIView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let photoView = UIImageView()
    private let priceLabel = UILabel()
    private let buyButton = UIButton(type: .system)
    private var productLink: String?
    var presenter: ShopPresenterProtocol!
    
    // MARK: - LIFYCYCLE:

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
        containerView.addSubviews(nameLabel, descriptionLabel, photoView, priceLabel, buyButton)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // CONTAINER VIEW:
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        // PHOTO VIEW:
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        photoView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.45).isActive = true
        photoView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1).isActive = true
        
        // NAME LABEL:
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        // DESCRIPTION LABEL:
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        // PRICE LABEL:
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 10).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -10).isActive = true
        
        // BUY BUTTON:
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        buyButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        buyButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        buyButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.2).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
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
        
        // NAME LABEL:
        nameLabel.textColor = .systemBlue
        nameLabel.font = fontBoldStandard22
        nameLabel.adjustsFontSizeToFitWidth = true
        
        // DESCRIPTION:
        descriptionLabel.textColor = .white
        descriptionLabel.font = fontLightStandard12
        descriptionLabel.numberOfLines = 0
        
        // PRICE LABEL:
        priceLabel.textColor = .systemOrange
        priceLabel.font = fontBoldStandard22
        
        // BUY BUTTON:
        buyButton.setTitle("Купить", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.titleLabel?.font = fontMediumStandard14
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
