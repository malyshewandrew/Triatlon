import UIKit

final class TeamCell: UITableViewCell {
    
    // MARK: - PROPERTIES:
    private let containerView = UIView()
    private let nameLabel = UILabel()
    private let countryLabel = UILabel()
    private let imageCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    private let layout = UICollectionViewFlowLayout()
    private var imagesArray = [UIImage]()
    private let achievementsLabel = UILabel()
    private let profileButton = UIButton()
    private var profileLink: String?
    private let workLabel = UILabel()
    var presenter: PeoplesPresenterProtocol!
    
    // MARK: - LIFYCYCLE:
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureConstreints()
        configureUI()
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ADD SUBVIEW:
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubviews(nameLabel, countryLabel, imageCollectionView, achievementsLabel, profileButton, workLabel)
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
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        
        // COUNTRY LABEL:
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
        countryLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        // IMAGE COLLECTION VIEW:
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        imageCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        imageCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        imageCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // ACHIEVEMENTS LABEL:
        achievementsLabel.translatesAutoresizingMaskIntoConstraints = false
        achievementsLabel.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 10).isActive = true
        achievementsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        achievementsLabel.trailingAnchor.constraint(equalTo: workLabel.leadingAnchor, constant: -20).isActive = true
        achievementsLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
            
        // WORK LABEL:
        workLabel.translatesAutoresizingMaskIntoConstraints = false
        workLabel.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 10).isActive = true
        workLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
        // PROFILE BUTTON:
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        profileButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        profileButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        profileButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.25).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    private func configureUI() {
        
        // CONTEN VIEW:
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        // CONTAINER VIEW:
        containerView.backgroundColor = .colorBackground
        containerView.layer.cornerRadius = cornerRadius
        
        // NAME LABEL:
        nameLabel.textColor = .white
        nameLabel.font = fontBoldStandard22
        
        // COUNTRY LABEL:
        countryLabel.font = .systemFont(ofSize: 30)
        
        // WORK LABEL:
        workLabel.textColor = .white
        workLabel.font = fontMediumStandard14
        workLabel.textAlignment = .right
        workLabel.adjustsFontSizeToFitWidth = true
        
        // ACHIEVEMENTS LABEL:
        achievementsLabel.font = fontLightStandard10
        achievementsLabel.textColor = .white
        achievementsLabel.numberOfLines = 0
        
        // PROFILE BUTTON:
        profileButton.backgroundColor = .systemBlue
        profileButton.setTitle("Профиль", for: .normal)
        profileButton.titleLabel?.font = fontMediumStandard14
        profileButton.layer.cornerRadius = cornerRadius
        profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        
        // IMAGE COLLECTION VIEW:
        imageCollectionView.layer.cornerRadius = cornerRadius
    }
    
    // MARK: - HELPERS:
    
    // CONFIGURE:
    func configure (with trainer: HumanModel) {
        nameLabel.text = trainer.name
        countryLabel.text = trainer.country
        imagesArray = trainer.photo
        achievementsLabel.text = trainer.achievements
        workLabel.text = trainer.work
        profileLink = trainer.url
    }
    
    // CONFIGURE COLLECTION VIEW:
    private func configureCollectionView() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 150, height: 200)
        imageCollectionView.collectionViewLayout = layout
        imageCollectionView.register(TeamCollectionView.self, forCellWithReuseIdentifier: "TeamCollectionView")
    }
    
    // PROFILE BUTTON:
    @objc private func profileButtonTapped() {
        presenter.profileButtonTapped(with: profileLink)
    }
}

// MARK: - EXTENSION:
extension TeamCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let imageCell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamCollectionView", for: indexPath) as? TeamCollectionView {
            imageCell.setImage(imagesArray[indexPath.row])
            return imageCell
        }
        return UICollectionViewCell()
    }
}
