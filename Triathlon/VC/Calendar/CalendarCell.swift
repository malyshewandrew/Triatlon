import UIKit

final class CalendarCell: UITableViewCell {
    
    // MARK: - PROPERTIES:
    private let containerView = UIView()
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    
    // MARK: - LIFECYCLE:
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
        containerView.addSubviews(nameLabel, dateLabel)
        
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // CONTAINER VIEW:
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        // NAME:
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        
        // DATE:
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // CONTENT VIEW:
        contentView.backgroundColor = .clear
        
        // CONTAINER VIEW:
        containerView.backgroundColor = .colorBackground
        
        // NAME:
        nameLabel.textColor = .white
        
        // DATE:
        dateLabel.textColor = .white
    }
    
    // MARK: - HELPERS:
    func configure(name: String, date: String) {
        nameLabel.text = name
        dateLabel.text = date
    }
}
