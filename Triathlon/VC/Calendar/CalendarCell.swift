import UIKit

final class CalendarCell: UITableViewCell {
    // MARK: - PROPERTIES:

    private let containerView = UIView()
    private let nameLabel = UILabel()
    private let daysLeftLabel = UILabel()
    
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
        containerView.addSubviews(nameLabel, daysLeftLabel)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // CONTAINER VIEW:
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // NAME:
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        
        // DATE:
        daysLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLeftLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        daysLeftLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // CONTENT VIEW:
        contentView.backgroundColor = .clear
        
        // CONTAINER VIEW:
        containerView.layer.cornerRadius = cornerRadius
        containerView.backgroundColor = .colorBackground
        
        // NAME:
        nameLabel.textColor = .white
        nameLabel.font = fontBoldStandard16
        
        // DATE:
        daysLeftLabel.textColor = .white
        daysLeftLabel.font = fontBoldStandard16
    }
    
    // MARK: - HELPERS:

    func configure(name: String, daysLeft: Int) {
        nameLabel.text = name
        daysLeftLabel.text = "\(daysLeft)"
    }
}
