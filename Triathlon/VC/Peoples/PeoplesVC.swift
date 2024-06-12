import UIKit

// MARK: - PROTOCOL:
protocol PeoplesVCProtocol: AnyObject {
    
}

class PeoplesVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: PeoplesPresenterProtocol!
    private var segmentControl = UISegmentedControl()
    private let tableViewTrainer = UITableView()
    private let tableViewTeam = UITableView()
    private let trainerArray: [TrainerModel] = [
        TrainerModel(photo: [UIImage(resource: .adamovich)], name: "Алексей", surname: "Адамович", age: "35", country: "🏳️‍🌈", achievements: "Победитель победителей \nПризер призеров \nИ просто лучший Победитель победителей \nПризер призеров \nИ просто лучший", work: "Treiner Тренер", url: "https://google.com", phoneNumber: "+7 999 888 77 66"),
        TrainerModel(photo: [UIImage(resource: .coptur)], name: "Алексей", surname: "Адамович", age: "35", country: "🇰🇷", achievements: "Далеко бегу высоко прыгаю никода не устаю", work: "Супер Тренер", url: "https://google.com", phoneNumber: "+7 888 55 55 ")
    ]
    private let teamArray: [TrainerModel] = [
        TrainerModel(photo: [UIImage(resource: .meljah)], name: "Name", surname: "Surname", age: "5", country: "🇺🇸", achievements: "Super Herous", work: "King Sports", url: "https://google.com", phoneNumber: "+7 999 888 77 66")
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
        segmentControl.selectedSegmentIndex = 0
        segmentedControlValueChanged(sender: segmentControl)
    }
    
    // MARK: - CONFIGURE TABLE VIEWS
    private func configureTableView() {
        tableViewTrainer.delegate = self
        tableViewTrainer.dataSource = self
        tableViewTrainer.register(TrainerCustomCell.self, forCellReuseIdentifier: "TrainerCustomCell")
        tableViewTeam.delegate = self
        tableViewTeam.dataSource = self
        tableViewTeam.register(TeamCustomCell.self, forCellReuseIdentifier: "TeamCustomCell")
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(segmentControl, tableViewTrainer, tableViewTeam)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        segmentControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        segmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
        tableViewTrainer.translatesAutoresizingMaskIntoConstraints = false
        tableViewTrainer.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 20).isActive = true
        tableViewTrainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        tableViewTrainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        tableViewTrainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableViewTeam.translatesAutoresizingMaskIntoConstraints = false
        tableViewTeam.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 20).isActive = true
        tableViewTeam.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        tableViewTeam.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        tableViewTeam.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // VIEW:
        view.backgroundColor = .colorTabBar
        tableViewTrainer.backgroundColor = .colorTabBar
        tableViewTeam.backgroundColor = .colorTabBar
        tableViewTeam.isHidden = true
        
        // NAVIGATION CONTROLLER:
        navigationItem.title = ""
        navigationController?.navigationBar.isHidden = true
        
        // SEGMENT CONTROL
        segmentControl.backgroundColor = .white
        segmentControl.insertSegment(withTitle: "Тренеры", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "Состав", at: 1, animated: true)
        segmentControl.insertSegment(withTitle: "Спортсмены", at: 2, animated: true)
        segmentControl.insertSegment(withTitle: "Команда", at: 3, animated: true)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)

    }
    
    // MARK: - objc methods
    @objc private func segmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tableViewTrainer.isHidden = false
            tableViewTeam.isEditing = true
        case 1:
            tableViewTrainer.isHidden = true
            tableViewTeam.isHidden = false
        case 2:
            print("Спортсмены")
        case 3:
            print("Команда")
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
            if let cell = tableViewTrainer.dequeueReusableCell(withIdentifier: "TrainerCustomCell", for: indexPath) as? TrainerCustomCell {
                let trainer = trainerArray[indexPath.row]
                cell.configure(with: trainer)
                return cell
            }
        } else if tableView == tableViewTeam {
            if let cell = tableViewTeam.dequeueReusableCell(withIdentifier: "TeamCustomCell", for: indexPath) as? TeamCustomCell {
                let trainer = teamArray[indexPath.row]
                cell.configure(with: trainer)
                return cell
            }
        }
        return UITableViewCell()
    }
}
