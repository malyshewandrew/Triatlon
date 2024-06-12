import Foundation
import UIKit

// MARK: - PROTOCOL:
protocol PeoplesPresenterProtocol {
    func selectedSegmentControl(sender: UISegmentedControl)
}

final class PeoplesPresenter: PeoplesPresenterProtocol {
    
    unowned let view: PeoplesVCProtocol

    init(view: PeoplesVCProtocol) {
        self.view = view
    }
    
    func selectedSegmentControl(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("Состав")
        case 1:
            print("Состав")
        case 2:
            print("Спортсмены")
        case 3:
            print("Команда")
        default:
            print("Не выбрано")
        }
    }
}
