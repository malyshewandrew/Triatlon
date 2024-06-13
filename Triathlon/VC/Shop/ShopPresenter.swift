import UIKit

// MARK: - PROTOCOL:

protocol ShopPresenterProtocol {
    func shopButtonTapped(with productLink: String?)
}

final class ShopPresenter: ShopPresenterProtocol {
    // MARK: - PROPERTIES:
    
    unowned let view: ShopVCProtocol

    // MARK: - INIT:
    init(view: ShopVCProtocol) {
        self.view = view
    }
    
    // MARK: - METHODS:

    func shopButtonTapped(with productLink: String?) {
        guard let link = productLink, let url = URL(string: link), UIApplication.shared.canOpenURL(url) else {
            print("Cannot open the URL.")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
