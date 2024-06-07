import Foundation

// MARK: - protocol
protocol PeoplesPresenterProtocol {
    
}

final class PeoplesPresenter: PeoplesPresenterProtocol {
    
    unowned let view: PeoplesVCProtocol

    init(view: PeoplesVCProtocol) {
        self.view = view
    }
}
