import UIKit

// MARK: - PROTOCOL:

protocol ShopPresenterProtocol {
    func shopButtonTapped(with productLink: String?)
    func selectedSegmentControl(sender: UISegmentedControl)
}

final class ShopPresenter: ShopPresenterProtocol {
    // MARK: - PROPERTIES:
    
    unowned let view: ShopVCProtocol

    // MARK: - INIT:
    init(view: ShopVCProtocol) {
        self.view = view
    }
    
    // MARK: - METHODS:

    // SHOP BUTTON TAPPED:
    func shopButtonTapped(with productLink: String?) {
        guard let link = productLink, let url = URL(string: link), UIApplication.shared.canOpenURL(url) else {
            print("Cannot open the URL.")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    // SELECTED SEGMENTED CONTROL:
    func selectedSegmentControl(sender: UISegmentedControl) {
            switch sender.selectedSegmentIndex {
            case 0:
                view.showClothesTableView()
            case 1:
                view.hideTableView()
            case 2:
                view.hideTableView()
            case 3:
                view.hideTableView()
            case 4:
                view.hideTableView()
            default:
                view.hideTableView()
            }
        }
}
