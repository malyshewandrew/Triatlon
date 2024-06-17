import UIKit

// MARK: - PROTOCOL:

protocol ScheduleVCProtocol: AnyObject {
    
}

final class ScheduleVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: SchedulePresenterProtocol!
    private let backgroundImage = UIImageView()
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(backgroundImage, titleLabel, tableView)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // BACKGROUND VIEW:
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // TITLE:
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        
        // TABLE VIEW:
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 35).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // VIEW:
        view.backgroundColor = .colorMain
        
        // NAVIGATION CONTROLLER:
        navigationItem.title = ""
        
        // BACKGROUND VIEW:
        backgroundImage.image = UIImage(resource: .background)
        
        // TITLE:
        titleLabel.textColor = .white
        titleLabel.text = "Группы Tristyle:"
        titleLabel.font = fontBoldStandard16
        
        // TABLE VIEW:
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ScheduleCell.self, forCellReuseIdentifier: "ScheduleCell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
    
    // MARK: - HELPERS:
}

// MARK: - EXTENSION:

extension ScheduleVC: ScheduleVCProtocol {}

extension ScheduleVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as? ScheduleCell else { return UITableViewCell() }
        let group = arrayGroups[indexPath.row]
        cell.configure(schedule: group)
        cell.presenter = presenter
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap to group")
    }
}
