import UIKit

// MARK: - PROTOCOL:
protocol PeoplesVCProtocol: AnyObject {
    
}

class PeoplesVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: PeoplesPresenterProtocol!
    private var segmentControl = UISegmentedControl()
    private let tableViewTrainer = UITableView()
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        configureTableViewTrainer()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        segmentControl.selectedSegmentIndex = 0
        segmentedControlValueChanged(sender: segmentControl)
    }
    
    // MARK: - CONFIGURE TABLE VIEWS
    private func configureTableViewTrainer() {
        tableViewTrainer.delegate = self
        tableViewTrainer.dataSource = self
        tableViewTrainer.register(TrainerCustomCell.self, forCellReuseIdentifier: "TrainerCustomCell")
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(segmentControl, tableViewTrainer)
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
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // VIEW:
        view.backgroundColor = .colorTabBar
        
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
            print("Тренеры")
        case 1:
            print("Состав")
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
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableViewTrainer.dequeueReusableCell(withIdentifier: "TrainerCustomCell", for: indexPath) as? TrainerCustomCell {
            // config
            return cell
        }
        return UITableViewCell()
    }
}
