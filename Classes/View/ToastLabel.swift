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

class ToastLabel: UILabel {
    var insetTop: CGFloat = 8
    var insetBottom: CGFloat = 8
    var insetLeft: CGFloat = 8
    var insetRight: CGFloat = 8
    
    override public var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += (insetTop + insetBottom)
        contentSize.width += (insetLeft + insetRight)
        return contentSize
    }
    
    override func drawText(
            in rect: CGRect
        ) {
        
        let insets: UIEdgeInsets = UIEdgeInsets(top: insetTop, left: insetLeft, bottom: insetBottom, right: insetRight)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        numberOfLines = 0
    }
}
