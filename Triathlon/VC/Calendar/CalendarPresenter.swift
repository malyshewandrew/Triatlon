import UIKit

// MARK: - PROTOCOL:

protocol CalendarPresenterProtocol {
    func viewDidLoad()
    func viewWillAppear()
    func numberOfEvents(for date: Date) -> Int
    func titleDefaultColor(for date: Date) -> UIColor
    func didSelect(date: Date)
    func shouldSelect(date: Date) -> Bool
    func numberOfRows() -> Int
    func event(at index: Int) -> CalendarModel
    func daysLeft(for event: CalendarModel) -> Int
    func date(from string: String) -> Date?
}

final class CalendarPresenter: CalendarPresenterProtocol {
    // MARK: - PROPERTIES:

    unowned let view: CalendarVCProtocol
    private var eventDates: [CalendarModel] = []
    private let dateFormatter: DateFormatter

    // MARK: - INIT:

    init(view: CalendarVCProtocol, dateFormatter: DateFormatter = DateFormatter()) {
        self.view = view
        self.dateFormatter = dateFormatter
        self.dateFormatter.dateFormat = "dd.MM.yyyy"
    }

    // MARK: - METHODS:

    func viewDidLoad() {
        fetchEventDates()
    }
    
    func viewWillAppear() {
        view.showActivityIndicator()
        fetchEventDates()
    }

    func numberOfEvents(for date: Date) -> Int {
        let dateString = dateFormatter.string(from: date)
        return eventDates.filter { $0.date == dateString }.count
    }

    func titleDefaultColor(for date: Date) -> UIColor {
        let dateString = dateFormatter.string(from: date)
        return eventDates.contains(where: { $0.date == dateString }) ? .red : .black
    }

    func didSelect(date: Date) {
        if let eventDate = eventDates.first(where: { dateFormatter.date(from: $0.date) == date }) {
            view.showAlert(title: "Мероприятие:", message: eventDate.name)
        }
    }

    func shouldSelect(date: Date) -> Bool {
        let dateString = dateFormatter.string(from: date)
        return eventDates.contains { $0.date == dateString }
    }

    func numberOfRows() -> Int {
        return eventDates.count
    }

    func event(at index: Int) -> CalendarModel {
        return eventDates[index]
    }
    
    func date(from string: String) -> Date? {
        return dateFormatter.date(from: string)
    }

    // DAYS LEFT:
    func daysLeft(for event: CalendarModel) -> Int {
        guard let date = dateFormatter.date(from: event.date) else { return 0 }
        let calendar = Calendar.current
        let currentDate = Date()
        let components = calendar.dateComponents([.day], from: currentDate.startOfDay, to: date.startOfDay)
        return components.day ?? 0
    }

    // FETCH EVENT DATES:
    private func fetchEventDates() {
        FetchCalendarDates.shared.fetchEventDates { [weak self] eventDates in
            guard let self = self else { return }
            self.eventDates = eventDates.filter { event in
                if let date = self.dateFormatter.date(from: event.date), date > Date() {
                    return true
                }
                return false
            }.sorted { event1, event2 in
                if let date1 = self.dateFormatter.date(from: event1.date),
                   let date2 = self.dateFormatter.date(from: event2.date) {
                    return date1 < date2
                }
                return false
            }
            DispatchQueue.main.async {
                self.view.reloadTableView()
                self.view.reloadCalendar()
                self.view.hideActivityIndicator()
                self.view.setCountLabel(countLabel: "Впереди мероприятий: \(eventDates.count).")
            }
        }
    }
}
