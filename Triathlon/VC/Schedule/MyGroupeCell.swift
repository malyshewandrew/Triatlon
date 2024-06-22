import UIKit

final class MyGroupeCell: UITableViewCell {
    // MARK: - PROPERTIES:

    private let containerView = UIView()
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
        containerView.addSubviews()
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
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // CONTENT VIEW:
        selectionStyle = .none
        contentView.backgroundColor = .clear
        
        // CONTAINER VIEW:
        containerView.backgroundColor = .colorBackground
        containerView.layer.cornerRadius = cornerRadius
    }
    
    // MARK: - HELPERS:
}
