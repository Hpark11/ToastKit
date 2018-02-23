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

public struct Toast {
    public static var duration: Duration = .short
    public static var position: Position = .bottom
    public static var minimumInsets: UIEdgeInsets = UIEdgeInsets(top: 40, left: 16, bottom: 40, right: 16)
    public static var configuration: ToastConfiguration = ToastConfiguration()
    
    public enum Position {
        case top
        case bottom
        case center
    }
    
    public enum Duration {
        case short
        case normal
        case long
        case custom(TimeInterval)
        
        static func time(_ value: Duration) -> TimeInterval {
            switch value {
                case .short: return 3.0
                case .normal: return 4.5
                case .long: return 6.0
                case .custom(let time): return time
            }
        }
    }
    
    @available(iOS 9.0, *)
    public static func makeView<VC: UIViewController>(
            _ base:         VC,
            view:           UIView,
            duration:       Duration = duration,
            position:       Position = position,
            minimumInsets:  UIEdgeInsets = minimumInsets,
            configuration:  ToastConfiguration = configuration
        ) {
    
        let toastView = ViewFactory.createToastView(UIView.self, configuration: configuration)
        base.view.addSubview(toastView)
        toastView.content.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            toastView.content.heightAnchor.constraint(equalTo: view.heightAnchor),
            toastView.content.widthAnchor.constraint(equalTo: view.widthAnchor),
            view.centerXAnchor.constraint(equalTo: toastView.content.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: toastView.content.centerYAnchor)
        ])
        
        toast(base, toastView: toastView, duration: duration, position: position, minimumInsets: minimumInsets, configuration: configuration)
    }
    
    @available(iOS 9.0, *)
    public static func makeImage<VC: UIViewController>(
            _ base:         VC,
            image:          UIImage,
            duration:       Duration = duration,
            position:       Position = position,
            minimumInsets:  UIEdgeInsets = minimumInsets,
            configuration:  ToastConfiguration = configuration
        ) {
        
        let toastView = ViewFactory.createToastView(UIImageView.self, configuration: configuration)
        base.view.addSubview(toastView)
        toastView.content.image = image
        
        toast(base, toastView: toastView, duration: duration, position: position, minimumInsets: minimumInsets, configuration: configuration)
    }
    
    @available(iOS 9.0, *)
    public static func makeText<VC: UIViewController>(
            _ base:         VC,
            text:           String,
            duration:       Duration = duration,
            position:       Position = position,
            minimumInsets:  UIEdgeInsets = minimumInsets,
            configuration:  ToastConfiguration = configuration
        ) {
        
        let toastView = ViewFactory.createToastView(ToastLabel.self, configuration: configuration)
        base.view.addSubview(toastView)
        toastView.content.text = text
        
        toast(base, toastView: toastView, duration: duration, position: position, minimumInsets: minimumInsets, configuration: configuration)
    }
    
    @available(iOS 9.0, *)
    private static func toast<VC: UIViewController, T>(
            _ base:         VC,
            toastView:      ToastView<T>,
            duration:       Duration,
            position:       Position,
            minimumInsets:  UIEdgeInsets,
            configuration:  ToastConfiguration
        ) {
        
        ContentPlacer.placeToastView(toastView, baseView: base.view, position: position, insets: minimumInsets)
        ContentPlacer.placeContent(toastView, icon: configuration.icon)
        base.view.layoutIfNeeded()
        
        toastView.popup(duration: duration, enter: configuration.motion.enter)
    }
}

