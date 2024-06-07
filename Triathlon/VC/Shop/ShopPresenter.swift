import Foundation

// MARK: - protocol
protocol ShopPresenterProtocol {
    
}

final class ShopPresenter: ShopPresenterProtocol {
    
    unowned let view: ShopVCProtocol

    init(view: ShopVCProtocol) {
        self.view = view
    }
}
