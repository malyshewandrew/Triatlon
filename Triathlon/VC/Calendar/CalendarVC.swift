import FSCalendar
import UIKit

// MARK: - protocol

protocol CalendarVCProtocol: AnyObject {}
 
final class CalendarVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: CalendarPresenterProtocol!
    private let calendarView = UIView()
    private var calendar = FSCalendar()
    private let tableView = UITableView()
    private let markedDates: [Date: String] = [
        Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 15))!: "Соревнования 15 июня",
        Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 18))!: "Соревнования 18 июня",
        Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 27))!: "Соревнования 27 июня"
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
        view.addSubviews(calendarView, tableView)
        calendarView.addSubviews(calendar)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        
        // CALENDAR VIEW:
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        calendarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calendarView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        calendarView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        // CALENDAR:
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.topAnchor.constraint(equalTo: calendarView.topAnchor).isActive = true
        calendar.bottomAnchor.constraint(equalTo: calendarView.bottomAnchor).isActive = true
        calendar.centerXAnchor.constraint(equalTo: calendarView.centerXAnchor).isActive = true
        calendar.widthAnchor.constraint(equalTo: calendarView.widthAnchor, multiplier: 0.95).isActive = true
        
        // TABLE VIEW:
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 25).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // VIEW:
        view.backgroundColor = .colorTabBar
        
        // NAVIGATION CONTROLLER:
        navigationItem.title = "Календарь"
        
        // CALENDAR VIEW:
        calendarView.layer.cornerRadius = cornerRadius
        calendarView.layer.masksToBounds = true
        calendarView.layer.borderWidth = 1
        calendarView.layer.borderColor = UIColor.white.cgColor
        
        // CALENDAR:
        calendar.dataSource = self
        calendar.delegate = self
        let appearance = calendar.appearance
        appearance.headerTitleColor = .white
        appearance.weekdayTextColor = .systemRed
        appearance.titleDefaultColor = .white
        appearance.titleTodayColor = .white
        appearance.todayColor = .systemBlue
        appearance.selectionColor = .systemOrange
        appearance.eventDefaultColor = .systemRed
        appearance.borderRadius = 1
        
        // TABLE VIEW:
        tableView.dataSource = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    // MARK: - HELPERS:
}

// MARK: - EXTENSIONS:

extension CalendarVC: CalendarVCProtocol {
    
}

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
        markedDates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarCell", for: indexPath) as? CalendarCell else { return UITableViewCell() }
        return cell
    }
}
