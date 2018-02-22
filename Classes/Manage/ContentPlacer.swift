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
struct ContentPlacer {
    internal static func placeToastView<T>(
            _ view:         ToastView<T>,
            baseView:       UIView,
            position:       Toast.Position,
            offset:         CGFloat
        ) {
        
        var constraints = [
            view.leadingAnchor.constraint(greaterThanOrEqualTo: baseView.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(lessThanOrEqualTo: baseView.trailingAnchor, constant: 16)
        ]
        
        switch position {
        case .top:
            constraints.append(view.centerXAnchor.constraint(equalTo: baseView.centerXAnchor))
            constraints.append(view.topAnchor.constraint(equalTo: baseView.topAnchor, constant: offset))
        case .center:
            constraints.append(view.centerXAnchor.constraint(equalTo: baseView.centerXAnchor))
            constraints.append(view.centerYAnchor.constraint(equalTo: baseView.centerYAnchor))
        case .bottom:
            constraints.append(view.centerXAnchor.constraint(equalTo: baseView.centerXAnchor))
            constraints.append(view.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -offset))
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    internal static func placeContent<T>(
            _ content:      T,
            container:      ToastView<T>,
            icon:           ToastConfiguration.Icon?
        ) {
        
        if let icon = icon {
            let iconView = UIImageView(image: icon.image)
            iconView.contentMode = .scaleToFill
            iconView.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(iconView)
            
            var nc = [
                iconView.widthAnchor.constraint(equalToConstant: icon.width),
                iconView.heightAnchor.constraint(equalToConstant: icon.width),
                
                iconView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 4),
                iconView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                
                content.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 4),
                content.trailingAnchor.constraint(equalTo: container.trailingAnchor),
                content.centerYAnchor.constraint(equalTo: container.centerYAnchor)
            ]
            
            if container.contentSize.height > icon.width {
                nc.append(container.heightAnchor.constraint(equalTo: content.heightAnchor))
            } else {
                nc.append(container.heightAnchor.constraint(equalTo: iconView.heightAnchor, constant: 4))
            }
            
            NSLayoutConstraint.activate(nc)
        } else {
            NSLayoutConstraint.activate([
                container.heightAnchor.constraint(equalTo: content.heightAnchor),
                container.widthAnchor.constraint(equalTo: content.widthAnchor),
                content.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                content.centerYAnchor.constraint(equalTo: container.centerYAnchor)
            ])
        }
    }
}
