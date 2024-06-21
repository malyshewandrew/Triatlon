import UIKit

// MARK: - PROTOCOL:
protocol PeoplesVCProtocol: AnyObject {
    func showTrainerTableView()
    func showTeamTableView()
    func hideAllTableViews()
}

final class PeoplesVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: PeoplesPresenterProtocol!
    private let backgroundImage = UIImageView()
    private var segmentedControl = UISegmentedControl()
    private let tableViewTrainer = UITableView()
    private let tableViewTeam = UITableView()
    private let vibration = Vibration()
    
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
        presenter.selectedSegmentControl(sender: segmentedControl)
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
        view.addSubviews(backgroundImage, segmentedControl, tableViewTrainer, tableViewTeam)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        
        // BACKGROUND VIEW:
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // SEGMENTED CONTROL:
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
        // TABLE VIEW TRAINER:
        tableViewTrainer.translatesAutoresizingMaskIntoConstraints = false
        tableViewTrainer.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        tableViewTrainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        tableViewTrainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        tableViewTrainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // TABLE VIEW TEAM:
        tableViewTeam.translatesAutoresizingMaskIntoConstraints = false
        tableViewTeam.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        tableViewTeam.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        tableViewTeam.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        tableViewTeam.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // VIEW:
        view.backgroundColor = .colorMain
        
        // BACKGROUND VIEW:
        backgroundImage.image = UIImage(resource: .background)
        
        // TABLE VIEW TRAINER:
        tableViewTrainer.backgroundColor = .clear
        tableViewTrainer.isHidden = true
        tableViewTrainer.separatorStyle = .none
        
        // TABLE VIEW TEAM:
        tableViewTeam.backgroundColor = .clear
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
    
    // SEGMENTED CONTROL VALUE CHANGED:
    @objc private func segmentedControlValueChanged(sender: UISegmentedControl) {
        vibration.vibrationStandart()
        presenter.selectedSegmentControl(sender: sender)
    }
}

// MARK: - EXTENSION:

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
                cell.backgroundColor = .clear
                return cell
            }
        } else if tableView == tableViewTeam {
            if let cell = tableViewTeam.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as? TeamCell {
                let trainer = teamArray[indexPath.row]
                cell.configure(with: trainer)
                cell.presenter = presenter
                cell.backgroundColor = .clear
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vibration.vibrationStandart()
    }
}

// MARK: - PROTOCOL:
extension PeoplesVC: PeoplesVCProtocol {
    // SHOW TRAINERS:
    func showTrainerTableView() {
        tableViewTrainer.isHidden = false
        tableViewTeam.isHidden = true
    }
    // SHOW TEAM:
    func showTeamTableView() {
        tableViewTrainer.isHidden = true
        tableViewTeam.isHidden = false
    }
    // HIDE ALL:
    func hideAllTableViews() {
        tableViewTrainer.isHidden = true
        tableViewTeam.isHidden = true
    }
}
