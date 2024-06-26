import UIKit

// MARK: - protocol
protocol ScheduleVCProtocol: AnyObject {
}

class ScheduleVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: SchedulePresenterProtocol!
    private let titleLabel = UILabel()
    private let tableView = UITableView()
    let arrayGroups: [ScheduleModel] = [ScheduleModel(name: "Группа триатлон", trainer: "Дмитрий Мелях", photo: UIImage(resource: .meljah), sport: "Велоспорт, бег", description: "Вторник, пятница"), ScheduleModel(name: "Группа плавания", trainer: "Дмитрий Коптуа", photo: UIImage(resource: .coptur), sport: "Плавание", description: "Вторник, суббота"), ScheduleModel(name: "Триатлон", trainer: "Дмитрий Толкачев", photo: UIImage(resource: .tolkachev), sport: "Велоспорт, бег, плавание", description: "Понедельник, пятница"), ScheduleModel(name: "Группа бег", trainer: "Алексей Адамович", photo: UIImage(resource: .adamovich), sport: "Бег", description: "Среда, пятница")]
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(titleLabel, tableView)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // TITLE:
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        
        // TABLE VIEW:
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: titleLabel.topAnchor,constant: 35).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // VIEW:
        view.backgroundColor = .colorTabBar
        
        // NAVIGATION CONTROLLER:
        navigationItem.title = ""
        
        // TITLE:
        titleLabel.textColor = .white
        titleLabel.text = "Группы Tristyle:"
        titleLabel.font = fontBoldStandard16
        
        // TABLE VIEW:
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ScheduleCell.self, forCellReuseIdentifier: "ScheduleCell")
        tableView.backgroundColor = .colorTabBar
        tableView.separatorStyle = .none
    }
    
    // MARK: - HELPERS:
}

// MARK: - EXTENSION:
extension ScheduleVC: ScheduleVCProtocol {
}

extension ScheduleVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as? ScheduleCell else { return UITableViewCell() }
        let group = arrayGroups[indexPath.row]
        cell.configure(photo: group.photo, name: group.name, trainer: group.trainer, sport: group.sport, description: group.description)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap to group")
    }
}
