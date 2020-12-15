
import UIKit


extension UIStoryboard {
    func instantiate<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        return instantiateViewController(withIdentifier: name) as! T
    }
    
    func instantiate<T: UIViewController>(_ identifier:String) -> T {
        return instantiateViewController(withIdentifier: identifier) as! T
    }
    
    func instantiate(_ controller:UIViewController, viewModel:Any) {
        return
    }
}

