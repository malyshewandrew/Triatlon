import Foundation
import UIKit

// MARK: - PROTOCOL:
protocol PeoplesPresenterProtocol {
    func selectedSegmentControl(sender: UISegmentedControl)
    func phoneButtonTapped(with phoneNumber: String?)
    func profileButtonTapped(with prifileLink: String?)
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
    
    // PHONE BUTTON TAPPED:
    func phoneButtonTapped(with phoneNumber: String?) {
        guard let phoneNumber = phoneNumber else { return }
        guard let phoneURL = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(phoneURL) else {
            print("Cannot make a phone call.")
            return
        }
        UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
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
