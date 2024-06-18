import FirebaseDatabase
import UIKit

class FetchCalendarDates {
    static let shared = FetchCalendarDates()
    private let database = Database.database().reference()
    
    private init() {}
    
    func fetchEventDates(completion: @escaping ([CalendarModel]) -> Void) {
        database.child("eventDates").observeSingleEvent(of: .value) { snapshot in
            var eventDates: [CalendarModel] = []
            
            guard let value = snapshot.value as? [String: Any] else {
                completion(eventDates)
                return
            }
            
            for (_, data) in value {
                if let eventData = data as? [String: String],
                   let date = eventData["date"],
                   let name = eventData["name"]
                {
                    let calendarModel = CalendarModel(date: date, name: name)
                    eventDates.append(calendarModel)
                }
            }
            
            completion(eventDates)
        }
    }
}
