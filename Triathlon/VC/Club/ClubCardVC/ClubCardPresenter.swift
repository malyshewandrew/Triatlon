import UIKit

// MARK: - PROTOCOL:

protocol ClubCardPresenterProtocol {
    func selectedSegmentControl(sender: UISegmentedControl)
    func webButtonTapped(with webLink: String?)
}

final class ClubCardPresenter: ClubCardPresenterProtocol {
    // MARK: - PROPERTIES:

    unowned let view: ClubCardVCProtocol

    // MARK: - INIT:

    init(view: ClubCardVCProtocol) {
        self.view = view
    }

    // MARK: - METHODS:

    // SELECTED SEGMENTED CONTROL:
    func selectedSegmentControl(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.showPartnerTableView()
        case 1:
            view.hidePartnerTableView()
        default:
            print("Не выбрано")
        }
    }
    
    // WEB BUTTON TAPPED:
    func webButtonTapped(with webLink: String?) {
        guard let link = webLink, let url = URL(string: link), UIApplication.shared.canOpenURL(url) else {
            print("Cannot open the URL.")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
