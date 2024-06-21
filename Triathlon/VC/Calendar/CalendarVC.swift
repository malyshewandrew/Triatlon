import FSCalendar
import UIKit

// MARK: - PROTOCOL:

protocol CalendarVCProtocol: AnyObject {
    func reloadCalendar()
    func reloadTableView()
    func showAlert(title: String, message: String)
    func showActivityIndicator()
    func hideActivityIndicator()
    func setCountLabel(countLabel: String)
}

final class CalendarVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: CalendarPresenterProtocol!
    private let backgroundImage = UIImageView()
    private let titleLabel = UILabel()
    private let calendarView = UIView()
    private var calendar = FSCalendar()
    private let countLabel = UILabel()
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    private let tableView = UITableView()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let vibration = Vibration()

    // MARK: - LIFECYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(backgroundImage, titleLabel, calendarView, countLabel, nameLabel, dateLabel, tableView)
        calendarView.addSubviews(calendar)
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
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // CALENDAR VIEW:
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive = true
        calendarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calendarView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        calendarView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        // CALENDAR:
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.topAnchor.constraint(equalTo: calendarView.topAnchor).isActive = true
        calendar.bottomAnchor.constraint(equalTo: calendarView.bottomAnchor).isActive = true
        calendar.centerXAnchor.constraint(equalTo: calendarView.centerXAnchor).isActive = true
        calendar.widthAnchor.constraint(equalTo: calendarView.widthAnchor, multiplier: 0.95).isActive = true
        
        // COUNT LABEL:
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countLabel.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 20).isActive = true
        
        // NAME LABEL:
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 50).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // DATE LABEL:
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 50).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        // TABLE VIEW:
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
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
        titleLabel.textAlignment = .center
        titleLabel.text = "Календарь Tristyle:"
        titleLabel.font = fontBoldStandard16
        
        // CALENDAR VIEW:
        calendarView.layer.cornerRadius = cornerRadius
        calendarView.layer.masksToBounds = true
        calendarView.layer.borderWidth = 1
        calendarView.layer.borderColor = UIColor.white.cgColor
        
        // CALENDAR:
        calendar.dataSource = self
        calendar.delegate = self
        calendar.scrollDirection = .vertical
        let appearance = calendar.appearance
        appearance.headerTitleColor = .white
        appearance.weekdayTextColor = .systemRed
        appearance.titleDefaultColor = .white
        appearance.titleTodayColor = .white
        appearance.todayColor = .systemBlue
        appearance.selectionColor = .clear
        appearance.eventDefaultColor = .systemRed
        appearance.caseOptions = .headerUsesUpperCase
        appearance.headerTitleColor = .white
        appearance.headerTitleFont = fontBoldStandard16
        appearance.borderRadius = 1
        
        // COUNT LABEL:
        countLabel.textColor = .white
        countLabel.textAlignment = .center
        countLabel.font = fontLightStandard12
        
        // NAME LABEL:
        nameLabel.textColor = .white
        nameLabel.text = "Название:"
        nameLabel.font = fontMediumStandard14
        
        // DATE LABEL:
        dateLabel.textColor = .white
        dateLabel.text = "Осталось:"
        dateLabel.font = fontMediumStandard14
        
        // TABLE VIEW:
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(CalendarCell.self, forCellReuseIdentifier: "CalendarCell")
        tableView.backgroundColor = .clear
    }
}

// MARK: - EXTENSIONS:

extension CalendarVC: CalendarVCProtocol {

    // RELOAD CALENDAR:
    func reloadCalendar() {
        calendar.reloadData()
    }
    
    // RELOAD TABLE VIEW:
    func reloadTableView() {
        tableView.reloadData()
    }
    
    // SHOW ALERT
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // SHOW ACTIVITY INDICATOR:
    func showActivityIndicator() {
        self.activityIndicator.center = view.center
        self.activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
    }
    
    // HIDE ACTIVITY INDICATOR:
    func hideActivityIndicator() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
    }
    
    // SET COUNT LABEL:
    func setCountLabel(countLabel: String) {
        self.countLabel.text = countLabel
    }
}

// MARK: - CALENDAR:

extension CalendarVC: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return presenter.numberOfEvents(for: date)
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        return presenter.titleDefaultColor(for: date)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        presenter.didSelect(date: date)
    }
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        return presenter.shouldSelect(date: date)
    }
}

// MARK: - TABLE VIEW:

extension CalendarVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarCell", for: indexPath) as? CalendarCell else {
            return UITableViewCell()
        }
        let eventDate = presenter.event(at: indexPath.row)
        cell.configure(name: eventDate.name, daysLeft: presenter.daysLeft(for: eventDate))
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vibration.vibrationStandart()
    }
}
