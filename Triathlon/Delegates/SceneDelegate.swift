import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    // CREATE SCENE:
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let tabBarController = TabBarController()
        
        self.window = window
        if UserDefaults.standard.bool(forKey: "FirstOpen") {
            window.rootViewController = tabBarController
        } else {
            let onboaringVC = OnboardingVC()
            let clubPresenter = OnboardingPresenter(view: onboaringVC)
            onboaringVC.presenter = clubPresenter
            let onboardingNavigationController = UINavigationController(rootViewController: onboaringVC)
            window.rootViewController = onboardingNavigationController
        }
        window.makeKeyAndVisible()
        
        // CHECK AUTH:
        checkUserAuthenticationStatus()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    
    // CHECK AUTH:
    func checkUserAuthenticationStatus() {
        if let user = Auth.auth().currentUser {
            print("Пользователь аутентифицирован, email: \(user.email ?? "Не указан")")
        } else {
            print("Пользователь не аутентифицирован")
        }
    }
}
