import UIKit

// MARK: - PROTOCOL:

protocol SchedulePresenterProtocol {
    func joinButtonTapped()
}

final class SchedulePresenter: SchedulePresenterProtocol {

    // MARK: - PROPERTIES:
    unowned let view: ScheduleVCProtocol

    // MARK: - INIT:
    init(view: ScheduleVCProtocol) {
        self.view = view
    }
    
    // MARK: - METHODS:
    
    // JOIN BUTTON TAPPED:
    func joinButtonTapped() {
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
