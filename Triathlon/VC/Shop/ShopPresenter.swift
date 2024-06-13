import UIKit

// MARK: - protocol

protocol ShopPresenterProtocol {
    func shopButtonTapped(with productLink: String?)
}

final class ShopPresenter: ShopPresenterProtocol {
    unowned let view: ShopVCProtocol

    init(view: ShopVCProtocol) {
        self.view = view
    }

    func shopButtonTapped(with productLink: String?) {
        guard let link = productLink, let url = URL(string: link), UIApplication.shared.canOpenURL(url) else {
            print("Cannot open the URL.")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
