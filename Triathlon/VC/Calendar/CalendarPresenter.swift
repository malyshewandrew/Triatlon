import Foundation

// MARK: - PROTOCOL:

protocol CalendarPresenterProtocol {
    
}

final class CalendarPresenter: CalendarPresenterProtocol {
    // MARK: - PROPERTIES:

    unowned let view: CalendarVCProtocol

    // MARK: - INIT:

    init(view: CalendarVCProtocol) {
        self.view = view
    }

    // MARK: - METHODS:
}
