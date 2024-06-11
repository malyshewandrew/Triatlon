import UIKit

final class ScheduleCell: UITableViewCell {
    
    // MARK: - PROPERTIES:
    private let containerView = UIView()
    private let nameLabel = UILabel()
    private let trainerName = UILabel()
    private let photoView = UIImageView()
    private let sportLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let joinButton = UIButton(type: .system)
    
    // MARK: - LIFYCYCLE:
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureConstraints()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        contentView.addSubviews(containerView)
        containerView.addSubviews(nameLabel, trainerName, photoView, sportLabel, descriptionLabel, joinButton)
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
        containerView.heightAnchor.constraint(equalToConstant: 175).isActive = true
        
        // PHOTO VIEW:
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        photoView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.3).isActive = true
        photoView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1).isActive = true
        
        // NAME LABEL:
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7).isActive = true
        
        // TRAINER:
        trainerName.translatesAutoresizingMaskIntoConstraints = false
        trainerName.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        trainerName.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 10).isActive = true
        trainerName.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7).isActive = true
        
        // SPORT LABEL:
        sportLabel.translatesAutoresizingMaskIntoConstraints = false
        sportLabel.topAnchor.constraint(equalTo: trainerName.bottomAnchor, constant: 10).isActive = true
        sportLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 10).isActive = true
        sportLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7).isActive = true
        
        // DESCRIPTION:
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: sportLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 10).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7).isActive = true
        
        // JOIN BUTTON:
        joinButton.translatesAutoresizingMaskIntoConstraints = false
        joinButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        joinButton.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 10).isActive = true
        joinButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.3).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        
        // CONTENT VIEW:
        selectionStyle = .none
        contentView.backgroundColor = .colorTabBar
        
        // CONTAINER VIEW:
        containerView.backgroundColor = .colorBackground
        containerView.layer.cornerRadius = cornerRadius
        
        // PHOTO VIEW:
        photoView.layer.masksToBounds = true
        photoView.layer.cornerRadius = cornerRadius
        photoView.contentMode = .scaleAspectFill
        
        // NAME LABEL:
        nameLabel.textColor = .white
        nameLabel.font = fontBoldStandard16
        
        // TRAINER:
        trainerName.textColor = .white
        trainerName.font = fontMediumStandard14
        
        // SPORT LABEL:
        sportLabel.textColor = .white
        sportLabel.font = fontMediumStandard14
        
        // DESCRIPTION:
        descriptionLabel.textColor = .white
        descriptionLabel.font = fontMediumStandard14
        
        // JOIN BUTTON:
        joinButton.setTitle("Записаться", for: .normal)
        joinButton.setTitleColor(.white, for: .normal)
        joinButton.layer.masksToBounds = true
        joinButton.layer.cornerRadius = cornerRadius
        joinButton.backgroundColor = .systemGreen
    }
    
    // MARK: - HELPERS:
    func configure (photo: UIImage, name: String, trainer: String, sport: String, description: String) {
        photoView.image = photo
        nameLabel.text = name
        trainerName.text = trainer
        sportLabel.text = sport
        descriptionLabel.text = description
    }
}
