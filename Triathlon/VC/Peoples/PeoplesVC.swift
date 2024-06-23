import UIKit

// MARK: - PROTOCOL:
protocol PeoplesVCProtocol: AnyObject {
    func showTrainerTableView()
    func showTeamTableView()
    func showSportsmensTableView()
    func showTristyleTableView()
    func hideAllTableViews()
}

final class PeoplesVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: PeoplesPresenterProtocol!
    private let backgroundImage = UIImageView()
    private var segmentedControl = UISegmentedControl()
    private let trainerTableView = UITableView()
    private let teamTableView = UITableView()
    private let sportsmensTableView = UITableView()
    private let tristyleTableView = UITableView()
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
        trainerTableView.delegate = self
        trainerTableView.dataSource = self
        trainerTableView.register(TrainerCell.self, forCellReuseIdentifier: "TrainerCell")
        teamTableView.delegate = self
        teamTableView.dataSource = self
        teamTableView.register(TeamCell.self, forCellReuseIdentifier: "TeamCell")
        sportsmensTableView.delegate = self
        sportsmensTableView.dataSource = self
        sportsmensTableView.register(SportsmensCell.self, forCellReuseIdentifier: "SportsmensCell")
        tristyleTableView.delegate = self
        tristyleTableView.dataSource = self
        tristyleTableView.register(TristyleCell.self, forCellReuseIdentifier: "TristyleCell")
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(backgroundImage, segmentedControl, trainerTableView, teamTableView, sportsmensTableView, tristyleTableView)
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
        trainerTableView.translatesAutoresizingMaskIntoConstraints = false
        trainerTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        trainerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        trainerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        trainerTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // TABLE VIEW TEAM:
        teamTableView.translatesAutoresizingMaskIntoConstraints = false
        teamTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        teamTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        teamTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        teamTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // TABLE VIEW SPORTSMENS:
        sportsmensTableView.translatesAutoresizingMaskIntoConstraints = false
        sportsmensTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        sportsmensTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        sportsmensTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        sportsmensTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // TABLE VIEW TRISTYLE:
        tristyleTableView.translatesAutoresizingMaskIntoConstraints = false
        tristyleTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        tristyleTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        tristyleTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        tristyleTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // VIEW:
        view.backgroundColor = .colorMain
        
        // BACKGROUND VIEW:
        backgroundImage.image = UIImage(resource: .background)
        
        // TABLE VIEW TRAINER:
        trainerTableView.backgroundColor = .clear
        trainerTableView.isHidden = true
        trainerTableView.separatorStyle = .none
        
        // TABLE VIEW TEAM:
        teamTableView.backgroundColor = .clear
        teamTableView.isHidden = true
        teamTableView.separatorStyle = .none
        
        // TABLE VIEW SPORTSMENS:
        sportsmensTableView.backgroundColor = .clear
        sportsmensTableView.isHidden = true
        sportsmensTableView.separatorStyle = .none
        
        // TABLE VIEW TRISTYLE:
        tristyleTableView.backgroundColor = .clear
        tristyleTableView.isHidden = true
        tristyleTableView.separatorStyle = .none
        
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
        if tableView == trainerTableView {
            return trainerArray.count
        } else if tableView == teamTableView {
            return teamArray.count
        } else if tableView == sportsmensTableView {
            return sportsmensArray.count
        } else if tableView == tristyleTableView {
            return tristyleArray.count
        }
       return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == trainerTableView {
            if let cell = trainerTableView.dequeueReusableCell(withIdentifier: "TrainerCell", for: indexPath) as? TrainerCell {
                let trainer = trainerArray[indexPath.row]
                cell.configure(with: trainer)
                cell.presenter = presenter
                cell.backgroundColor = .clear
                return cell
            }
        } else if tableView == teamTableView {
            if let cell = teamTableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as? TeamCell {
                let team = teamArray[indexPath.row]
                cell.configure(with: team)
                cell.presenter = presenter
                cell.backgroundColor = .clear
                return cell
            } 
        } else if tableView == sportsmensTableView {
            if let cell = teamTableView.dequeueReusableCell(withIdentifier: "SportsmensCell", for: indexPath) as? SportsmensCell {
                let sportsmen = teamArray[indexPath.row]
                cell.configure(with: sportsmen)
                cell.presenter = presenter
                cell.backgroundColor = .clear
                return cell
            }
        } else if tableView == tristyleTableView {
            if let cell = teamTableView.dequeueReusableCell(withIdentifier: "TristyleCell", for: indexPath) as? TristyleCell {
                let tristyle = teamArray[indexPath.row]
                cell.configure(with: tristyle)
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
        trainerTableView.isHidden = false
        teamTableView.isHidden = true
        sportsmensTableView.isHidden = true
        tristyleTableView.isHidden = true
    }
    
    // SHOW TEAM:
    func showTeamTableView() {
        trainerTableView.isHidden = true
        teamTableView.isHidden = false
        sportsmensTableView.isHidden = true
        tristyleTableView.isHidden = true
    }
    
    // SHOW SPORTSMNES:
    func showSportsmensTableView() {
        trainerTableView.isHidden = true
        teamTableView.isHidden = true
        sportsmensTableView.isHidden = false
        tristyleTableView.isHidden = true
    }
    
    // SHOW TRISTYLE:
    func showTristyleTableView() {
        trainerTableView.isHidden = true
        teamTableView.isHidden = true
        sportsmensTableView.isHidden = true
        tristyleTableView.isHidden = false
    }
    
    // HIDE ALL:
    func hideAllTableViews() {
        trainerTableView.isHidden = true
        teamTableView.isHidden = true
        sportsmensTableView.isHidden = true
        tristyleTableView.isHidden = true
    }
}
