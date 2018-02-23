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

import UIKit

@available(iOS 9.0, *)
class ToastView<T: UIView>: UIView, CAAnimationDelegate {
    var content = T()

    var configuration: ToastConfiguration = ToastConfiguration() {
        didSet {
            //layer.backgroundColor = configuration.backgroundColor
            layer.cornerRadius = configuration.cornerRadius
            
            backgroundColor = configuration.backgroundColor.withAlphaComponent(0.6)

            translatesAutoresizingMaskIntoConstraints = false
            content.translatesAutoresizingMaskIntoConstraints = false
            
            clipsToBounds = true
            layer.shadowColor = UIColor.clear.cgColor

            if let label = content as? ToastLabel {
                label.textColor = configuration.label.textColor
                
                label.font = configuration.label.font
            } else if let imageView = content as? UIImageView {
                
            }
            
            self.addSubview(content)
        }
    }

    var contentSize: CGSize {
        guard let baseView = superview else { return CGSize.zero }
        
        if let label = content as? ToastLabel {
            let size = CGSize(width: baseView.bounds.width - 32, height: baseView.bounds.height)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            return NSString(string: label.text!).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: configuration.label.font], context: nil).size
        } else if let imageView = content as? UIImageView {
            return CGSize.zero
        } else {
            return CGSize.zero
        }
    }
    
    internal func animationDidStop(
            _ anim: CAAnimation,
            finished flag: Bool
        ) {
        
        guard let name = anim.value(forKey: "name") as? String,
            let interval = anim.value(forKey: "duration") as? TimeInterval else { return }
        if name == "toastIn" {
            displayAndFinalizeToast(interval: interval)
        } else if name == "toastOut" {
            layer.removeAllAnimations()
            removeFromSuperview()
        }
    }
    
    internal func displayAndFinalizeToast(
            interval: TimeInterval
        ) {
        
        MotionHandler.trigger(after: interval, completion: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dismiss(exit: strongSelf.configuration.motion.exit)
        })
    }
    
    internal func popup(
            duration: Toast.Duration,
            enter: ToastEnter
        ) {
        
        func animate(with keyPath: KeyPath, from: Any?, to: Any?, duration: Toast.Duration) {
            let animation = generateLayerAnimation(keyPath: keyPath, from: from, to: to)
            animation.setValue(Toast.Duration.time(duration), forKey: "duration")
            animation.setValue("toastIn", forKey: "name")
            self.layer.add(animation, forKey: nil)
        }
        
        func animate(with transition: UIViewAnimationOptions, duration: Toast.Duration) {
            UIView.transition(with: self, duration: 0.01, options: [.curveEaseOut, .transitionCrossDissolve], animations: {
                self.isHidden = true
            }, completion: { _ in
                UIView.transition(with: self, duration: 0.72, options: [.curveEaseIn, transition], animations: {
                    self.isHidden = false
                }, completion: { _ in
                    self.displayAndFinalizeToast(interval: Toast.Duration.time(duration))
                })
            })
        }
        
        guard let baseView = self.superview else { return }
        
        switch enter {
            case .flipFromLeft:     animate(with: .transitionFlipFromLeft, duration: duration)
            case .flipFromRight:    animate(with: .transitionFlipFromRight, duration: duration)
            case .flipFromTop:      animate(with: .transitionFlipFromTop, duration: duration)
            case .flipFromBottom:   animate(with: .transitionFlipFromBottom, duration: duration)
            case .curlDown:         animate(with: .transitionCurlDown, duration: duration)
            case .fadeIn:           animate(with: .transitionCrossDissolve, duration: duration)
            case .scaleUp:          animate(with: .transform(.scale), from: 0.25, to: 1, duration: duration)
            case .slideFromLeft:    animate(with: .position(.x), from: -(bounds.width), to: layer.position.x, duration: duration)
            case .slideFromright:   animate(with: .position(.x), from: baseView.bounds.width, to: layer.position.x, duration: duration)
            case .slideFromTop:     animate(with: .position(.y), from: -(bounds.height), to: layer.position.y, duration: duration)
            case .slideFromBottom:  animate(with: .position(.y), from: baseView.bounds.height, to: layer.position.y, duration: duration)
        }
    }
    
    internal func dismiss(
            exit: ToastExit
        ) {
        
        func animate(with keyPath: KeyPath, from: Any?, to: Any?) {
            let animation = generateLayerAnimation(keyPath: keyPath, from: from, to: to)
            animation.setValue("toastOut", forKey: "name")
            animation.fillMode = kCAFillModeForwards
            animation.isRemovedOnCompletion = false
            
            // animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            self.layer.add(animation, forKey: nil)
        }

        func animate(with transition: UIViewAnimationOptions) {
            UIView.transition(with: self, duration: 0.72, options: [.curveEaseOut, transition], animations: {
                self.isHidden = true
            }, completion: { _ in
                self.removeFromSuperview()
            })
        }
        
        guard let baseView = self.superview else { return }
        
        switch exit {
            case .flipFromLeft:     animate(with: .transitionFlipFromLeft)
            case .flipFromRight:    animate(with: .transitionFlipFromRight)
            case .flipFromTop:      animate(with: .transitionFlipFromTop)
            case .flipFromBottom:   animate(with: .transitionFlipFromBottom)
            case .curlUp:           animate(with: .transitionCurlDown)
            case .fadeOut:          animate(with: .transitionCrossDissolve)
            case .scaleDown:        animate(with: .transform(.scale), from: 1.0, to: 0.0)
            case .slideToLeft:      animate(with: .position(.x), from: layer.position.x, to: -(bounds.width + 12))
            case .slideToRight:     animate(with: .position(.x), from: layer.position.x, to: baseView.bounds.width + 12)
            case .slideToTop:       animate(with: .position(.y), from: layer.position.y, to: -(bounds.height + 12))
            case .slideToBottom:    animate(with: .position(.y), from: layer.position.y, to: baseView.bounds.height + 12)
        }
    }
    
    private func generateLayerAnimation(
            keyPath:    KeyPath,
            from:       Any?,
            to:         Any?
        ) -> CASpringAnimation {
        
        let animation: CASpringAnimation
        
        switch keyPath {
        case .position(let pos): animation = CASpringAnimation(keyPath: pos.raw)
        case .transform(let tf): animation = CASpringAnimation(keyPath: tf.raw)
        case .translation(let ts): animation = CASpringAnimation(keyPath: ts.raw)
        case .color(let clr): animation = CASpringAnimation(keyPath: clr.raw)
        }
        
        animation.delegate = self
        animation.fromValue = from
        animation.toValue = to
        //        slideAnimation.mass = 10.0
        //        slideAnimation.initialVelocity = 100.0
        //        slideAnimation.stiffness = 1500.0
        //        slideAnimation.damping = 50.0
        animation.duration = animation.settlingDuration
        return animation
    }
}
