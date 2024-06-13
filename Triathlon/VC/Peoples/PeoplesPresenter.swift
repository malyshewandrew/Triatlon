import Foundation
import UIKit

// MARK: - PROTOCOL:

protocol PeoplesPresenterProtocol {
    func selectedSegmentControl(sender: UISegmentedControl)
    func profileButtonTapped(with prifileLink: String?)
}

final class PeoplesPresenter: PeoplesPresenterProtocol {

    // MARK: - PROPERTIES:
    unowned let view: PeoplesVCProtocol

    // MARK: - INIT:
    init(view: PeoplesVCProtocol) {
        self.view = view
    }
    
    // MARK: - METHODS:
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

    // PROFILE BUTTON TAPPED:
    func profileButtonTapped(with prifileLink: String?) {
        guard let link = prifileLink, let url = URL(string: link), UIApplication.shared.canOpenURL(url) else {
            print("Cannot open the URL.")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
