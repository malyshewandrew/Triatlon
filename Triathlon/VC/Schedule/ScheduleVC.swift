import UIKit

// MARK: - PROTOCOL:

protocol ScheduleVCProtocol: AnyObject {
    func showMyGroupe()
    func hideMyGroupe()
}

final class ScheduleVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: SchedulePresenterProtocol!
    private let backgroundImage = UIImageView()
    private let segmentedControl = UISegmentedControl()
    private let myGroupeTableView = UITableView()
    private let allGroupesTableView = UITableView()
    private let vibration = Vibration()
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(backgroundImage, segmentedControl, myGroupeTableView, allGroupesTableView)
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
        segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
        // MY GROUPE TABLE VIEW:
        myGroupeTableView.translatesAutoresizingMaskIntoConstraints = false
        myGroupeTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 25).isActive = true
        myGroupeTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myGroupeTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        myGroupeTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
                
        // ALL GROUPES TABLE VIEW:
        allGroupesTableView.translatesAutoresizingMaskIntoConstraints = false
        allGroupesTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 25).isActive = true
        allGroupesTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        allGroupesTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        allGroupesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // VIEW:
        view.backgroundColor = .colorMain
        
        // NAVIGATION CONTROLLER:
        navigationItem.title = ""
        navigationController?.navigationBar.isHidden = true
        
        // BACKGROUND VIEW:
        backgroundImage.image = UIImage(resource: .background)
        
        // SEGMENTED CONTROL
        segmentedControl.backgroundColor = .colorBackground
        segmentedControl.selectedSegmentTintColor = .colorBackground
        let normalTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        segmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
        segmentedControl.insertSegment(withTitle: "Моя группа", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Все группы", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        // MY GROUPE TABLE VIEW:
        myGroupeTableView.delegate = self
        myGroupeTableView.dataSource = self
        myGroupeTableView.backgroundColor = .clear
        myGroupeTableView.separatorStyle = .none
        myGroupeTableView.register(MyGroupeCell.self, forCellReuseIdentifier: "MyGroupeCell")
        
        // ALL GROUPES TABLE VIEW:
        allGroupesTableView.delegate = self
        allGroupesTableView.dataSource = self
        allGroupesTableView.backgroundColor = .clear
        allGroupesTableView.separatorStyle = .none
        allGroupesTableView.register(AllGroupesCell.self, forCellReuseIdentifier: "AllGroupesCell")
        allGroupesTableView.isHidden = true
    }
    
    // MARK: - HELPERS:
    
    // SEGMENTED CONTROL VALUE CHANGED:
    @objc private func segmentedControlValueChanged(sender: UISegmentedControl) {
        vibration.vibrationStandart()
        presenter.selectedSegmentControl(sender: sender)
    }
}

// MARK: - EXTENSION:
extension ScheduleVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == myGroupeTableView {
            return 1
        } else if tableView == allGroupesTableView {
            return arrayGroups.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == myGroupeTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupeCell", for: indexPath) as? MyGroupeCell else { return UITableViewCell() }
            cell.presenter = presenter
            cell.backgroundColor = .clear
            return cell
        } else if tableView == allGroupesTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupesCell", for: indexPath) as? AllGroupesCell else { return UITableViewCell() }
            let group = arrayGroups[indexPath.row]
            cell.configure(schedule: group)
            cell.presenter = presenter
            cell.backgroundColor = .clear
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vibration.vibrationStandart()
    }
}

// MARK: - PROTOCOL:
extension ScheduleVC: ScheduleVCProtocol {
    func showMyGroupe() {
        myGroupeTableView.isHidden = false
        allGroupesTableView.isHidden = true
    }
    
    func hideMyGroupe() {
        myGroupeTableView.isHidden = true
        allGroupesTableView.isHidden = false
    }
}
