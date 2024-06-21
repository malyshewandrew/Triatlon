import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    // MARK: - PROPERTIES:

    private let vibration = Vibration()
    
    // MARK: - LIFECYCLE:

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        configureTabBar()
    }

    // MARK: - HELPERS:
    
    // CONFIGURE TAB BAR:
    func configureTabBar() {
        // CLUB:
        let clubView = ClubVC()
        let clubPresenter = ClubPresenter(view: clubView)
        clubView.presenter = clubPresenter
        clubView.title = "Клуб"
        clubView.tabBarItem.image = UIImage(systemName: "flag.2.crossed.fill")
        let clubNavigationController = UINavigationController(rootViewController: clubView)
        
        // PEOPLES:
        let peoplesView = PeoplesVC()
        let peoplesPresenter = PeoplesPresenter(view: peoplesView)
        peoplesView.presenter = peoplesPresenter
        peoplesView.title = "Люди"
        peoplesView.tabBarItem.image = UIImage(systemName: "person.3.fill")
        let peoplesNavigationController = UINavigationController(rootViewController: peoplesView)
        
        // SCHEDULE:
        let scheduleView = ScheduleVC()
        let schedulePresenter = SchedulePresenter(view: scheduleView)
        scheduleView.presenter = schedulePresenter
        scheduleView.title = "Расписание"
        scheduleView.tabBarItem.image = UIImage(systemName: "clock")
        let scheduleNavigationController = UINavigationController(rootViewController: scheduleView)
        
        // CALENDAR:
        let calendarView = CalendarVC()
        let calendarPresenter = CalendarPresenter(view: calendarView)
        calendarView.presenter = calendarPresenter
        calendarView.title = "Календарь"
        calendarView.tabBarItem.image = UIImage(systemName: "calendar")
        let calendarNavigationController = UINavigationController(rootViewController: calendarView)
        
        // SHOP:
        let shopView = ShopVC()
        let shopPresenter = ShopPresenter(view: shopView)
        shopView.presenter = shopPresenter
        shopView.title = "Магазин"
        shopView.tabBarItem.image = UIImage(systemName: "arrow.up.bin.fill")
        let shopNavigationController = UINavigationController(rootViewController: shopView)
        
        // TAB BAR:
        self.setViewControllers([clubNavigationController, peoplesNavigationController, scheduleNavigationController, calendarNavigationController, shopNavigationController], animated: true)
        self.tabBar.tintColor = .systemBlue
        self.tabBar.backgroundColor = .clear
        self.tabBar.unselectedItemTintColor = .white
        self.tabBar.layer.cornerRadius = 10
    }
    
    // VIBRATION FOR TAB BAR ITEMS:
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController) {
            switch selectedIndex {
            case 0:
                vibration.vibrationStandart()
            case 1:
                vibration.vibrationStandart()
            case 2:
                vibration.vibrationStandart()
            case 3:
                vibration.vibrationStandart()
            case 4:
                vibration.vibrationStandart()
            default:
                break
            }
        }
    }
}
