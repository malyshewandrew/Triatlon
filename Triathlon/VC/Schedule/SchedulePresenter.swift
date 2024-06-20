import UIKit

// MARK: - PROTOCOL:

protocol SchedulePresenterProtocol {
    func selectedSegmentControl(sender: UISegmentedControl)
}

final class SchedulePresenter: SchedulePresenterProtocol {

    // MARK: - PROPERTIES:
    unowned let view: ScheduleVCProtocol

    // MARK: - INIT:
    init(view: ScheduleVCProtocol) {
        self.view = view
    }
    
    // MARK: - METHODS:
    
    // SELECTED SEGMENTED CONTROL:
    func selectedSegmentControl(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.showMyGroupe()
        case 1:
            view.hideMyGroupe()
        default:
            print("Не выбрано")
        }
    }
}
