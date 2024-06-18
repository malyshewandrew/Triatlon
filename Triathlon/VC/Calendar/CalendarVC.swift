import FSCalendar
import UIKit

// MARK: - PROTOCOL:

protocol CalendarVCProtocol: AnyObject {}
 
final class CalendarVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: CalendarPresenterProtocol!
    private let backgroundImage = UIImageView()
    private let titleLabel = UILabel()
    private let calendarView = UIView()
    private var calendar = FSCalendar()
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    private let tableView = UITableView()
    private var eventDates: [CalendarModel] = []
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }()

    private var sortedDates: [(date: Date, event: String)] = []
    private let vibration = Vibration()
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        filterDates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchEventDates()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(backgroundImage, titleLabel, calendarView, nameLabel, dateLabel, tableView)
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
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
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
        appearance.selectionColor = .systemOrange
        appearance.eventDefaultColor = .systemRed
        appearance.caseOptions = .headerUsesUpperCase
        appearance.headerTitleColor = .white
        appearance.headerTitleFont = fontBoldStandard16
        appearance.borderRadius = 1
        
        // NAME LABEL:
        nameLabel.textColor = .white
        nameLabel.text = "Название события:"
        nameLabel.font = fontMediumStandard14
        
        // DATE LABEL:
        dateLabel.textColor = .white
        dateLabel.text = "Осталось дней:"
        dateLabel.font = fontMediumStandard14
        
        // TABLE VIEW:
        tableView.dataSource = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(CalendarCell.self, forCellReuseIdentifier: "CalendarCell")
        tableView.backgroundColor = .clear
    }
    
    // MARK: - HELPERS:

    // FILTER DATES:
    private func filterDates() {
        let currentDate = Date()
        eventDates = eventDates
            .filter { dateFormatter.date(from: $0.date) ?? Date.distantPast > currentDate }
            .sorted { dateFormatter.date(from: $0.date)! < dateFormatter.date(from: $1.date)! }
        tableView.reloadData()
    }
    
    // FETCH EVENT DATES:
    private func fetchEventDates() {
        FirebaseService.shared.fetchEventDates { [weak self] eventDates in
            self?.eventDates = eventDates
            DispatchQueue.main.async {
                self?.filterDates()
                self?.updateCalendarEvents()
                self?.tableView.reloadData()
            }
        }
    }
    
    // UPDATE CALENDAR EVENTS:
    private func updateCalendarEvents() {
        calendar.reloadData()
    }
}

// MARK: - EXTENSIONS:

extension CalendarVC: CalendarVCProtocol {}

// CALENDAR:
extension CalendarVC: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateString = dateFormatter.string(from: date)
        return eventDates.filter { $0.date == dateString }.count
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        let dateString = dateFormatter.string(from: date)
        return eventDates.contains(where: { $0.date == dateString }) ? .red : .black
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if let eventDate = eventDates.first(where: { dateFormatter.date(from: $0.date) == date }) {
            let alert = UIAlertController(title: "Мероприятие:", message: eventDate.name, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            calendar.deselect(date)
        }
    }
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        let dateString = dateFormatter.string(from: date)
        return eventDates.contains { $0.date == dateString }
    }
}

// TABLE VIEW:
extension CalendarVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventDates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarCell", for: indexPath) as? CalendarCell else {
            return UITableViewCell()
        }
        let eventDate = eventDates[indexPath.row]
        if let date = dateFormatter.date(from: eventDate.date) {
            cell.configure(name: eventDate.name, daysLeft: calculateDaysLeft(to: date))
        } else {
            cell.configure(name: eventDate.name, daysLeft: 0)
        }
        cell.backgroundColor = .clear
        return cell
    }
    
    private func calculateDaysLeft(to date: Date) -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        let components = calendar.dateComponents([.day], from: currentDate.startOfDay, to: date.startOfDay)
        return components.day ?? 0
    }
}
