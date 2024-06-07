import Foundation

// MARK: - protocol
protocol ClubPresenterProtocol {
    
}

final class ClubPresenter: ClubPresenterProtocol {
    
    unowned let view: ClubVCProtocol
    
    init(view: ClubVCProtocol) {
        self.view = view
    }

}

