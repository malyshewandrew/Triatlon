import Foundation

// MARK: - protocol
protocol CalendarPresenterProtocol {
    
}

final class CalendarPresenter: CalendarPresenterProtocol {
    
    unowned let view: CalendarVCProtocol

    init(view: CalendarVCProtocol) {
        self.view = view
    }
}
