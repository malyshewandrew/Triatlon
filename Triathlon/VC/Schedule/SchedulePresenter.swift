import UIKit

// MARK: - PROTOCOL:

protocol SchedulePresenterProtocol {
}

final class SchedulePresenter: SchedulePresenterProtocol {

    // MARK: - PROPERTIES:
    unowned let view: ScheduleVCProtocol

    // MARK: - INIT:
    init(view: ScheduleVCProtocol) {
        self.view = view
    }
    
    // MARK: - METHODS:
}
