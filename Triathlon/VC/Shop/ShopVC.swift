import UIKit

// MARK: - PROTOCOL:

protocol ShopVCProtocol: AnyObject {
    func showClothesTableView()
    func hideTableView()
}

final class ShopVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: ShopPresenterProtocol!
    private let backgroundImage = UIImageView()
    private let vibration = Vibration()
    private var segmentedControl = UISegmentedControl()
    private let clothesTableView = UITableView()
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(backgroundImage, segmentedControl, clothesTableView)
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
        
        // TABLE VIEW:
        clothesTableView.translatesAutoresizingMaskIntoConstraints = false
        clothesTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        clothesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        clothesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        clothesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
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
        
        // SEGMENT CONTROL
        segmentedControl.backgroundColor = .colorBackground
        segmentedControl.selectedSegmentTintColor = .colorBackground
        let normalTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        segmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        segmentedControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        segmentedControl.insertSegment(withTitle: "Одежда", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Вело", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Бег", at: 2, animated: true)
        segmentedControl.insertSegment(withTitle: "Плавание", at: 3, animated: true)
        segmentedControl.insertSegment(withTitle: "Питание", at: 4, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        // TABLE VIEW:
        clothesTableView.delegate = self
        clothesTableView.dataSource = self
        clothesTableView.register(ShopCell.self, forCellReuseIdentifier: "ShopCell")
        clothesTableView.backgroundColor = .clear
        clothesTableView.separatorStyle = .none
        clothesTableView.isHidden = false
    }
    
    // MARK: - HELPERS:
    
    // SEGMENTED CONTROL VALUE CHANGED:
    @objc private func segmentedControlValueChanged(sender: UISegmentedControl) {
        vibration.vibrationStandart()
        presenter.selectedSegmentControl(sender: sender)
    }
}

// MARK: - EXTENSION:

extension ShopVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == clothesTableView {
            return clothesArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == clothesTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShopCell", for: indexPath) as? ShopCell else { return UITableViewCell() }
            let clothes = clothesArray[indexPath.row]
            cell.configure(product: clothes)
            cell.backgroundColor = .clear
            cell.presenter = presenter
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vibration.vibrationStandart()
    }
}

extension ShopVC: ShopVCProtocol {
    // SHOW CLOTHES:
    func showClothesTableView() {
        clothesTableView.isHidden = false
    }
    // HIDE TABLE VIEW:
    func hideTableView() {
        clothesTableView.isHidden = true
    }
}
