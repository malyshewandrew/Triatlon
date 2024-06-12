import UIKit

class TeamCustomCell: UITableViewCell {
    
    // MARK: - PROPERTIES:
    private let contenerView = UIView()
    private let nameLabel = UILabel()
    private let surnameLabel = UILabel()
    private let ageLabel = UILabel()
    private let countryLabel = UILabel()
    private let imageCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    private let layout = UICollectionViewFlowLayout()
    private var imagesArray = [UIImage]()
    private let achievementsLabel = UILabel()
    private let phoneButton = UIButton()
    private let profileButton = UIButton()
    private let workLabel = UILabel()
    
    // MARK: - LIFYCYCLE:
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureConstreints()
        setupUI()
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CONFIGURE:
    func configure (with trainer: TrainerModel) {
        nameLabel.text = trainer.name
        surnameLabel.text = trainer.surname
        ageLabel.text = trainer.age
        countryLabel.text = trainer.country
        imagesArray = trainer.photo
        achievementsLabel.text = trainer.achievements
        workLabel.text = trainer.work
    }
    
    // MARK: - CONFIGURE COLLECTION VIEW:
    private func configureCollectionView() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        imageCollectionView.collectionViewLayout = layout
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 350, height: 200)
        imageCollectionView.register(TeamImageCollectionViewCell.self, forCellWithReuseIdentifier: "TeamImageCollectionViewCell")
    }
    
    // MARK: - ADD SUBVIEW:
    private func addSubviews() {
        contentView.addSubview(contenerView)
        contenerView.addSubviews(nameLabel, surnameLabel, ageLabel, countryLabel, imageCollectionView, achievementsLabel, phoneButton, profileButton, workLabel)
    }
    
    // MARK: - CONFIGURE CONSTREINT:
    private func configureConstreints() {
        contenerView.translatesAutoresizingMaskIntoConstraints = false
        contenerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        contenerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        contenerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        contenerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: contenerView.topAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 8).isActive = true
        
        surnameLabel.translatesAutoresizingMaskIntoConstraints = false
        surnameLabel.topAnchor.constraint(equalTo: contenerView.topAnchor, constant: 8).isActive = true
        surnameLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 2).isActive = true
        
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.topAnchor.constraint(equalTo: contenerView.topAnchor, constant: 8).isActive = true
        ageLabel.leadingAnchor.constraint(equalTo: surnameLabel.trailingAnchor, constant: 2).isActive = true
        
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.topAnchor.constraint(equalTo: contenerView.topAnchor, constant: 8).isActive = true
        countryLabel.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -8).isActive = true
        
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        imageCollectionView.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 10).isActive = true
        imageCollectionView.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -10).isActive = true
        imageCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        achievementsLabel.translatesAutoresizingMaskIntoConstraints = false
        achievementsLabel.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 10).isActive = true
        achievementsLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 10).isActive = true
        achievementsLabel.widthAnchor.constraint(equalTo: contenerView.widthAnchor, multiplier: 0.4).isActive = true
        achievementsLabel.bottomAnchor.constraint(equalTo: contenerView.bottomAnchor, constant: -10).isActive = true
                
        phoneButton.translatesAutoresizingMaskIntoConstraints = false
        phoneButton.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -8).isActive = true
        phoneButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        phoneButton.widthAnchor.constraint(equalTo: contenerView.widthAnchor, multiplier: 0.3).isActive = true
        phoneButton.bottomAnchor.constraint(equalTo: contenerView.bottomAnchor, constant: -10).isActive = true
        
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -8).isActive = true
        profileButton.bottomAnchor.constraint(equalTo: phoneButton.topAnchor, constant: -5).isActive = true
        profileButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        profileButton.widthAnchor.constraint(equalTo: contenerView.widthAnchor, multiplier: 0.3).isActive = true
        
        workLabel.translatesAutoresizingMaskIntoConstraints = false
        workLabel.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor, constant: 10).isActive = true
        workLabel.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -8).isActive = true
        workLabel.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -5).isActive = true
        workLabel.widthAnchor.constraint(equalTo: contenerView.widthAnchor, multiplier: 0.4).isActive = true
    
    }
    
    // MARK: - SETUP UI:
    private func setupUI() {
        contenerView.backgroundColor = .colorBackground
        contenerView.layer.cornerRadius = cornerRadius
        contentView.backgroundColor = .colorTabBar
        
        nameLabel.text = "Name"
        nameLabel.textColor = .white
        nameLabel.font = fontBoldStandard16
        
        surnameLabel.text = "Surname"
        surnameLabel.textColor = .white
        surnameLabel.font = fontBoldStandard16
        
        ageLabel.text = "33"
        ageLabel.textColor = .white
        
        countryLabel.text = "Contry"
        countryLabel.textColor = .green
        
        workLabel.text = "Director Director Director Director Director"
        workLabel.textColor = .white
        workLabel.font = fontMediumStandard14
        workLabel.numberOfLines = .zero
        workLabel.textAlignment = .right
        
        achievementsLabel.font = fontMediumStandard14
        achievementsLabel.textColor = .white
        achievementsLabel.numberOfLines = .zero
        achievementsLabel.text = "Herous baba yaga  ex super herous baba yaga ex super herous baba yaga ex super herous baba yaga ex super herous baba yaga ex super herous baba yaga"
        
        phoneButton.backgroundColor = .systemGreen
        phoneButton.setTitle("Связаться", for: .normal)
        phoneButton.titleLabel?.font = fontMediumStandard14
        phoneButton.layer.cornerRadius = 8
        
        profileButton.backgroundColor = .systemGreen
        profileButton.setTitle("Профиль", for: .normal)
        profileButton.titleLabel?.font = fontMediumStandard14
        profileButton.layer.cornerRadius = 8
        
        imageCollectionView.layer.cornerRadius = cornerRadius
        
    }
    
    
}

// MARK: - EXTENSION:
extension TeamCustomCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let imageCell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamImageCollectionViewCell", for: indexPath) as? TeamImageCollectionViewCell {
            imageCell.setImage(imagesArray[indexPath.row])
            return imageCell
        }
        return UICollectionViewCell()
    }
}
