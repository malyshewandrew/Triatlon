import UIKit

final class ScheduleCell: UITableViewCell {
    // MARK: - PROPERTIES:

    private let containerView = UIView()
    private let nameLabel = UILabel()
    private let trainerName = UILabel()
    private let photoView = UIImageView()
    private let sportLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let placeLabel = UILabel()
    private let joinButton = UIButton(type: .system)
    var presenter: SchedulePresenterProtocol!
    
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
        containerView.addSubviews(nameLabel, trainerName, photoView, sportLabel, descriptionLabel, placeLabel, joinButton)
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
        
        // PLACE LABEL:
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        placeLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 10).isActive = true
        placeLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.7).isActive = true
        
        // JOIN BUTTON:
        joinButton.translatesAutoresizingMaskIntoConstraints = false
        joinButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        joinButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        joinButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.25).isActive = true
        joinButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
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
        nameLabel.textColor = .white
        nameLabel.font = fontBoldStandard16
        nameLabel.adjustsFontSizeToFitWidth = true
        
        // TRAINER:
        trainerName.textColor = .white
        trainerName.font = fontMediumStandard14
        trainerName.adjustsFontSizeToFitWidth = true
        
        // SPORT LABEL:
        sportLabel.textColor = .white
        sportLabel.font = fontMediumStandard14
        sportLabel.adjustsFontSizeToFitWidth = true
        
        // DESCRIPTION:
        descriptionLabel.textColor = .white
        descriptionLabel.font = fontMediumStandard14
        descriptionLabel.adjustsFontSizeToFitWidth = true
        
        // PLACE LABEL:
        placeLabel.textColor = .white
        placeLabel.font = fontMediumStandard14
        placeLabel.adjustsFontSizeToFitWidth = true
        
        // JOIN BUTTON:
        joinButton.setTitle("Записаться", for: .normal)
        joinButton.setTitleColor(.white, for: .normal)
        joinButton.titleLabel?.adjustsFontSizeToFitWidth = true
        joinButton.titleLabel?.font = fontMediumStandard14
        joinButton.layer.masksToBounds = true
        joinButton.layer.cornerRadius = cornerRadius
        joinButton.backgroundColor = .systemBlue
    }
    
    // MARK: - HELPERS:

    func configure(schedule: ScheduleModel) {
        photoView.image = schedule.photo
        nameLabel.text = schedule.name
        trainerName.text = "Тренер: " + schedule.trainer
        sportLabel.text = "Спорт: " + schedule.sport
        descriptionLabel.text = "Дни: " + schedule.days
        placeLabel.text = "Место: " + schedule.place
    }
}
