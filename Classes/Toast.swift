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
    
    @available(iOS 9.0, *)
    static func makeText<T: UIViewController>(
            _ base:         T,
            text:           String,
            position:       Position = .bottom,
            offset:         CGFloat = 40,
            configuration:  ToastConfiguration = ToastConfiguration()
        ) {
        
        let toastView = ViewFactory.createToastView(ToastLabel.self, configuration: configuration)
        base.view.addSubview(toastView)
        
        toastView.content.text = text
        ContentPlacer.placeToastView(toastView, baseView: base.view, position: position, offset: offset)
        ContentPlacer.placeContent(toastView.content, container: toastView, icon: configuration.icon)
    
        base.view.layoutIfNeeded()
    }
}

