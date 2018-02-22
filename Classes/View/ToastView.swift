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

class ToastView<T: UIView>: UIView {
    let content = T()

    var configuration: ToastConfiguration = ToastConfiguration() {
        didSet {
            layer.backgroundColor = configuration.backgroundColor
            layer.cornerRadius = 6
            
            clipsToBounds = true
            isHidden = true
            layer.shadowColor = UIColor.clear.cgColor
            translatesAutoresizingMaskIntoConstraints = false
            
            content.translatesAutoresizingMaskIntoConstraints = false
            
            if let label = content as? ToastLabel {
                label.textColor = .white
                label.numberOfLines = 0
                label.font = configuration.font
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
            
            return NSString(string: label.text!).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: configuration.font], context: nil).size
        } else if let imageView = content as? UIImageView {
            return CGSize.zero
        } else {
            return CGSize.zero
        }
    }
}
