import Foundation

// MARK: - protocol
protocol SchedulePresenterProtocol {
    
}

final class SchedulePresenter: SchedulePresenterProtocol {
    
    unowned let view: ScheduleVCProtocol

    init(view: ScheduleVCProtocol) {
        self.view = view
    }
}
