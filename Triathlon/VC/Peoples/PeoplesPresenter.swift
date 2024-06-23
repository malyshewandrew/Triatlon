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
    
    // SELECTED SEGMENTED CONTROL:
    func selectedSegmentControl(sender: UISegmentedControl) {
            switch sender.selectedSegmentIndex {
            case 0:
                view.showTrainerTableView()
            case 1:
                view.showTeamTableView()
            case 2:
                view.showSportsmensTableView()
            case 3:
                view.showTristyleTableView()
            default:
                view.hideAllTableViews()
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
