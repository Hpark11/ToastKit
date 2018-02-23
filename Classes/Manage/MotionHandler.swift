/*
 *  Copyright (c) 2018 hpark11 <qkrgustnrk@naver.com>
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */

struct MotionHandler {
    internal static func trigger(after: Double, completion: (() -> Void)?) {
        guard let execute = completion else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + after, execute: execute)
    }
    
    @available(iOS 9.0, *)
    internal static func toastIn<T>(
            _ view:     ToastView<T>,
            enter:      ToastEnter,
            completion: @escaping (Bool) -> ()
        ) {
        
        func transition(with option: UIViewAnimationOptions) {
            UIView.transition(with: view, duration: 0.01, options: [.curveEaseOut, .transitionCrossDissolve], animations: {
                view.isHidden = true
            }, completion: { _ in
                UIView.transition(with: view, duration: 0.72, options: [.curveEaseIn, option], animations: {
                    view.isHidden = false
                }, completion: completion)
            })
        }
        
        guard let baseView = view.superview else {
            completion(false)
            return
        }
        
        view.isHidden = false
        
        switch enter {
            case .flipFromLeft: transition(with: .transitionFlipFromLeft)
            case .flipFromRight: transition(with: .transitionFlipFromRight)
            case .flipFromTop: transition(with: .transitionFlipFromTop)
            case .flipFromBottom: transition(with: .transitionFlipFromBottom)
            case .curlDown: transition(with: .transitionCurlDown)
            case .fadeIn: transition(with: .transitionCrossDissolve)
            case .scaleUp: view.animateToast(keyPath: .transform(.scale), from: 0.25, to: 1)
            case .slideFromLeft: view.animateToast(keyPath: .position(.x), from: -(view.bounds.width), to: view.layer.position.x)
            case .slideFromright: view.animateToast(keyPath: .position(.x), from: baseView.bounds.width, to: view.layer.position.x)
            case .slideFromTop: view.animateToast(keyPath: .position(.y), from: -(view.bounds.height), to: view.layer.position.y)
            case .slideFromBottom: view.animateToast(keyPath: .position(.y), from: baseView.bounds.height, to: view.layer.position.y)
        }
    }
    
    internal static func toastOut<T>(
            _ view: ToastView<T>,
            exit: ToastExit
        ) {
        
        guard let baseView = view.superview else { return }
        let option: UIViewAnimationOptions
        
        func transition(with option: UIViewAnimationOptions) {
            UIView.transition(with: view, duration: 0.72, options: [.curveEaseOut, option], animations: {
                view.alpha = 0
            }, completion: { _ in
                view.removeFromSuperview()
            })
        }
        
        switch exit {
        case .flipFromLeft: transition(with: .transitionFlipFromLeft)
        case .flipFromRight: transition(with: .transitionFlipFromRight)
        case .flipFromTop: transition(with: .transitionFlipFromTop)
        case .flipFromBottom: transition(with: .transitionFlipFromBottom)
        case .curlUp: transition(with: .transitionCurlDown)
        case .fadeOut: transition(with: .transitionCrossDissolve)
        default:
            UIView.animate(withDuration: 0.72, delay: 0, usingSpringWithDamping: 0.72, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                switch exit {
                case .slideToLeft: view.frame.origin.x = -(view.bounds.width + 10)
                case .slideToRight: view.frame.origin.x = baseView.bounds.width + 10
                case .slideToTop: view.frame.origin.y = -(view.bounds.height + 10)
                case .slideToBottom: view.frame.origin.y = baseView.bounds.height + 10
                case .scaleDown:
                    view.frame.origin = CGPoint(x: view.frame.midX, y: view.frame.midY)
                    view.frame.size = CGSize.zero
                default: break
                }
            }, completion: { _ in
                view.isHidden = true
                view.removeFromSuperview()
            })
            return
        }
    }
}
