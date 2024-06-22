import UIKit

// MARK: - PROTOCOL:

protocol SchedulePresenterProtocol {
    func selectedSegmentControl(sender: UISegmentedControl)
    func writeButtonTapped()
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
    
    // WRITE BUTTON TAPPED:
    func writeButtonTapped() {
        let appURL = URL(string: "tg://resolve?domain=Tristyleteam")
        let webURL = URL(string: "https://t.me/Tristyleteam")
        guard let appURL = appURL else { return }
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            guard let webURL = webURL else { return }
            UIApplication.shared.open(webURL, options: [:], completionHandler: nil)
        }
    }
}
