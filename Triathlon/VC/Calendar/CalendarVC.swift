import UIKit

// MARK: - protocol
protocol CalendarVCProtocol: AnyObject {
    
}
 
class CalendarVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: CalendarPresenterProtocol!
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews()
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // VIEW:
        view.backgroundColor = .colorBackground
        
        // NAVIGATION CONTROLLER:
        navigationItem.title = ""

    }
    
    // MARK: - HELPERS:
}

// MARK: - EXTENSION:
extension CalendarVC: CalendarVCProtocol {
    
}
