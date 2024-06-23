import UIKit

// MARK: - PROTOCOL:

protocol ClubCardPresenterProtocol {
    func selectedSegmentControl(sender: UISegmentedControl)
    func webButtonTapped(with webLink: String?)
    func startBounce(cellView: UIView)
    func flipCard(oneView: UIView, twoView: UIView)
}

final class ClubCardPresenter: ClubCardPresenterProtocol {
    
    // MARK: - PROPERTIES:

    unowned let view: ClubCardVCProtocol
    private var isFlippedMissionsView = false

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
    
    // START BOUNCE:
    func startBounce(cellView: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            cellView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }, completion: { _ in
            UIView.animate(withDuration: 0.3) {
                cellView.transform = .identity
            }
        })
    }
    
    func flipCard(oneView: UIView, twoView: UIView) {
        isFlippedMissionsView = !isFlippedMissionsView
        let fromView = isFlippedMissionsView ? oneView : twoView
        let toView = isFlippedMissionsView ? twoView : oneView
        UIView.transition(from: fromView, to: toView, duration: 1, options: [.curveEaseOut, .transitionFlipFromRight, .showHideTransitionViews])
    }
    
}
