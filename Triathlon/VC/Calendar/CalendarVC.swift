import UIKit

class CalendarVC: UIViewController {
    // MARK: - PROPERTIES:
    
    var presenter: CalendarPresenter?
    
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
