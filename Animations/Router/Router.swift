
import UIKit


final class Router: NSObject {
    
    static let shared = Router()
    typealias ID = String
    
    fileprivate var window: UIWindow!
    var rootNavigation: UINavigationController!
    
    
    var transition: UIViewControllerAnimatedTransitioning? = nil
    
    //MARK: - Initialization
    
    override init() {
        let rootVC = FirstVC()
        rootVC.viewModel = FirstVM()
        
        rootNavigation = UINavigationController(rootViewController: rootVC)
        rootNavigation.isNavigationBarHidden = true
        super.init()
        rootNavigation.delegate = self
    }
    
    public func configureAppearance() {
        let navigationBarAppearace          = UINavigationBar.appearance()
        navigationBarAppearace.tintColor    = .white
        navigationBarAppearace.barTintColor = .black
    }
    
    public func makeVisible(windowScene: UIWindowScene)  {
        window = UIWindow()
        window!.rootViewController = rootNavigation
        window!.windowScene = windowScene
        window!.makeKeyAndVisible()
    }
    
    //MARK: - Global
    
    func showAlert(message: String? = nil) {
        let alert = UIAlertController(title: "Something went wrong",
                                      message: message ?? "try again",
                                      preferredStyle: .alert)
        
        let secondAction = UIAlertAction(title: "Okay",
                                         style: .default,
                                         handler: nil)
        alert.addAction(secondAction)
        self.rootNavigation.viewControllers.first!.present(alert, animated: true, completion: nil)
    }
    
    func pop(transition: UIViewControllerAnimatedTransitioning? = nil) {
        self.transition = transition
        rootNavigation.popViewController(animated: true)
    }
    
    func present(vc: UIViewController) {
        if let topController = UIApplication.topViewController() {
            topController.present(vc, animated: true, completion: nil)
        }
    }
    
    func poptoRoot() {
        rootNavigation.popToRootViewController(animated: true)
    }
    
    func poptoVC(vcClass:AnyClass) {
        let controllers = rootNavigation.viewControllers
        let maybeOurs   = controllers.filter { $0.isKind(of: vcClass)}.first
        
        if let vc = maybeOurs {
            rootNavigation.popToViewController(vc, animated: true)
        }
    }
    
    func push(_ controller: UIViewController) {
        rootNavigation.pushViewController(controller, animated: true)
    }
    
    func dissmissTop()  {
        if let topController = UIApplication.topViewController() {
            topController.dismiss(animated: true, completion: nil)
        }
    }
}

