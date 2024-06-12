import UIKit

// MARK: - protocol

protocol ShopVCProtocol: AnyObject {}

class ShopVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: ShopPresenterProtocol!
    
    private let vibration = Vibration()
    private var segmentedControl = UISegmentedControl()
    private let clothesTableView = UITableView()
    private let clothesArray: [ProductModel] = [
        ProductModel(name: "Майка Repeat", description: "- Приталенный силуэт\n- Принт шелкография", price: "35 BYN", link: "https://tristyleshop.by/sales/tproduct/162692404-463203246798-maika-repeat-muzhskaya", photo: .tshirt),
        ProductModel(name: "Худи Age Group", description: "- Спущенная линия плеча\n- Расширенный капюшон\n- Два боковых кармана\n - Рукава с вырезами для большого пальца\n - Манжет по низу и рукаву", price: "70 BYN", link: "https://tristyleshop.by/sales/tproduct/162692404-149769668430-hudi-age-group-zhenskaya", photo: .hoodie),
        ProductModel(name: "Майка Female Triathlete", description: "- Приталенный силуэт\n- Принт шелкография", price: "35 BYN", link: "https://tristyleshop.by/sales/tproduct/162692404-793756860850-maika-female-triathlete-zhenskaya", photo: .tshirtFemaleTriathlete)
    ]
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(segmentedControl, clothesTableView)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // SEGMENTED CONTROL:
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
        // TABLE VIEW:
        clothesTableView.translatesAutoresizingMaskIntoConstraints = false
        clothesTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        clothesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        clothesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        clothesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // VIEW:
        view.backgroundColor = .colorMain
        
        // NAVIGATION CONTROLLER:
        navigationItem.title = ""
        navigationController?.navigationBar.isHidden = true
        
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
        clothesTableView.backgroundColor = .colorMain
        clothesTableView.separatorStyle = .none
        clothesTableView.isHidden = false
    }
    
    // MARK: - HELPERS:
    
    @objc private func segmentedControlValueChanged(sender: UISegmentedControl) {
        vibration.vibrationStandart()
        switch sender.selectedSegmentIndex {
        case 0:
            clothesTableView.isHidden = false
        case 1:
            clothesTableView.isHidden = true
        case 2:
            clothesTableView.isHidden = true
        case 3:
            clothesTableView.isHidden = true
        case 4:
            clothesTableView.isHidden = true
        default:
            clothesTableView.isHidden = true
        }
    }
}

// MARK: - EXTENSION:

extension ShopVC: ShopVCProtocol {}

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
            cell.presenter = presenter
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap to item")
    }
}
