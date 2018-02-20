import UIKit

open class Toast: NSObject {
    enum Position {
        case top
        case bottom
        case center
    }
    
    enum Duration {
        case short
        case normal
        case long
        case custom(Double)
    }
    
    static func makeView<T: UIViewController>(_ base: T, view: UIView, position: Position = .bottom) {
        
    }
    
    static func makeImage<T: UIViewController>(_ base: T, image: UIImage, position: Position = .bottom) {
        
    }
    
    static func makeText<T: UIViewController>(_ base: T, text: String, position: Position = .bottom) {
        
    }
    
    private static func trigger(after: Double, completion: (() -> Void)?) {
        guard let execute = completion else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + after, execute: execute)
    }
}

