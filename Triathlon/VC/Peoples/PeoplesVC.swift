import UIKit

// MARK: - PROTOCOL:
protocol PeoplesVCProtocol: AnyObject {
    
}

class PeoplesVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: PeoplesPresenterProtocol!
    private var segmentedControl = UISegmentedControl()
    private let tableViewTrainer = UITableView()
    private let tableViewTeam = UITableView()
    private let trainerArray: [HumanModel] = [
        HumanModel(photo: [UIImage(resource: .adamovich), UIImage(resource: .adamovich), UIImage(resource: .adamovich)], name: "Имя Фамилия",  country: "🇧🇾", achievements: """
- Победитель соревнований
- Призер игр
- Мастер спорта
- Обладатель кубка
- Участник соревнвоаний
- Держатель рекорда
""", work: "Тренер по триатлону", url: "https://google.com", phoneNumber: "+375298607103"),
        HumanModel(photo: [UIImage(resource: .coptur), UIImage(resource: .coptur), UIImage(resource: .coptur)], name: "Имя Фамилия", country: "🇧🇾", achievements: """
- Победитель соревнований
- Призер игр
- Финишер первенства
- Держатель рекорда
- Обладатель кубка
- Кандидат в мастера спорта
""", work: "Тренер по плаванию", url: "https://google.com", phoneNumber: "+375298607103")
    ]
    private let teamArray: [HumanModel] = [
        HumanModel(photo: [UIImage(resource: .meljah), UIImage(resource: .meljah), UIImage(resource: .meljah)], name: "Имя Фамилия", country: "🇧🇾", achievements: """
- Финишер соревнований
- Участник игр
- Заслуженный мастер спорта
- Обладатель кубка
- Обладатель кубка
- Кандидат в мастера спорта
""", work: "Tristyle Team", url: "https://google.com", phoneNumber: "+375298607103")
    ]
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControlValueChanged(sender: segmentedControl)
    }
    
    // MARK: - CONFIGURE TABLE VIEWS
    private func configureTableView() {
        tableViewTrainer.delegate = self
        tableViewTrainer.dataSource = self
        tableViewTrainer.register(TrainerCell.self, forCellReuseIdentifier: "TrainerCell")
        tableViewTeam.delegate = self
        tableViewTeam.dataSource = self
        tableViewTeam.register(TeamCell.self, forCellReuseIdentifier: "TeamCell")
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(segmentedControl, tableViewTrainer, tableViewTeam)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        
        // SEGMENT CONTROL:
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
        // TABLE VIEW TRAINER:
        tableViewTrainer.translatesAutoresizingMaskIntoConstraints = false
        tableViewTrainer.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        tableViewTrainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        tableViewTrainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        tableViewTrainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // TABLE VIEW TEAM:
        tableViewTeam.translatesAutoresizingMaskIntoConstraints = false
        tableViewTeam.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        tableViewTeam.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        tableViewTeam.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        tableViewTeam.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // VIEW:
        view.backgroundColor = .colorMain
        
        // TABLE VIEW TRAINER:
        tableViewTrainer.backgroundColor = .colorMain
        tableViewTrainer.isHidden = true
        tableViewTrainer.separatorStyle = .none
        
        // TABLE VIEW TEAM:
        tableViewTeam.backgroundColor = .colorMain
        tableViewTeam.isHidden = true
        tableViewTeam.separatorStyle = .none
        
        // NAVIGATION CONTROLLER:
        navigationItem.title = ""
        navigationController?.navigationBar.isHidden = true
        
        // SEGMENTED CONTROL
        segmentedControl.backgroundColor = .colorBackground
        segmentedControl.selectedSegmentTintColor = .colorBackground
        let normalTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        segmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
        segmentedControl.insertSegment(withTitle: "Тренеры", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Состав", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Спортсмены", at: 2, animated: true)
        segmentedControl.insertSegment(withTitle: "Команда", at: 3, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
    }
    
    // MARK: - HELPERS:
    @objc private func segmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tableViewTrainer.isHidden = false
            tableViewTeam.isHidden = true
        case 1:
            tableViewTrainer.isHidden = true
            tableViewTeam.isHidden = false
        case 2:
            tableViewTrainer.isHidden = true
            tableViewTeam.isHidden = true
        case 3:
            tableViewTrainer.isHidden = true
            tableViewTeam.isHidden = true
        default:
            print("Не выбрано")
        }
    }
}

// MARK: - EXTENSION:
extension PeoplesVC: PeoplesVCProtocol {
    
}

extension PeoplesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableViewTrainer {
            return trainerArray.count
        } else if tableView == tableViewTeam {
            return teamArray.count
        }
       return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableViewTrainer {
            if let cell = tableViewTrainer.dequeueReusableCell(withIdentifier: "TrainerCell", for: indexPath) as? TrainerCell {
                let trainer = trainerArray[indexPath.row]
                cell.configure(with: trainer)
                cell.presenter = presenter
                return cell
            }
        } else if tableView == tableViewTeam {
            if let cell = tableViewTeam.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as? TeamCell {
                let trainer = teamArray[indexPath.row]
                cell.configure(with: trainer)
                cell.presenter = presenter
                return cell
            }
        }
        return UITableViewCell()
    }
}
