import FSCalendar
import UIKit

// MARK: - protocol

protocol CalendarVCProtocol: AnyObject {}
 
final class CalendarVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: CalendarPresenterProtocol!
    private let titleLabel = UILabel()
    private let calendarView = UIView()
    private var calendar = FSCalendar()
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    private let tableView = UITableView()
    private let markedDates: [Date: String] = [
        Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 21))!: "Ironman Minsk",
        Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 24))!: "Indoor Triathlon",
        Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 26))!: "Water Cup",
        Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 17))!: "Презентация Tristyle",
        Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 30))!: "Triathlon start",
        Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 2))!: "Test date"
    ]
    private var sortedDates: [(date: Date, event: String)] = []
    private let vibration = Vibration()
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        sortedDates = markedDates.map { (date: $0.key, event: $0.value) }.sorted { $0.date < $1.date }
        filterDates()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(titleLabel, calendarView, nameLabel, dateLabel, tableView)
        calendarView.addSubviews(calendar)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
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
        tableView.backgroundColor = .colorMain
    }
    
    // MARK: - HELPERS:

    private func filterDates() {
        let currentDate = Date()
        sortedDates = markedDates.filter { $0.key > currentDate }
            .map { (date: $0.key, event: $0.value) }
            .sorted { $0.date < $1.date }
        tableView.reloadData()
    }
}

// MARK: - EXTENSIONS:

extension CalendarVC: CalendarVCProtocol {}

// CALENDAR:
extension CalendarVC: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return markedDates.keys.contains(date) ? 1 : 0
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        return markedDates.keys.contains(date) ? .red : .black
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if let message = markedDates[date] {
            vibration.vibrationStandart()
            let alert = UIAlertController(title: "Старт Tristyle", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            calendar.deselect(date)
        }
    }
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        return markedDates.keys.contains(date)
    }
}

// TABLE VIEW:
extension CalendarVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedDates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarCell", for: indexPath) as? CalendarCell else {
            return UITableViewCell()
        }
        let start = sortedDates[indexPath.row]
        cell.configure(name: start.event, daysLeft: calculateDaysLeft(to: start.date))
        return cell
    }
    
    private func calculateDaysLeft(to date: Date) -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        let components = calendar.dateComponents([.day], from: currentDate.startOfDay, to: date.startOfDay)
        return components.day ?? 0
    }
}
