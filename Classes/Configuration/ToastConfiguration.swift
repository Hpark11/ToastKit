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

public struct ToastConfiguration {
    public var icon: Icon?
    public var motion: Motion = Motion()
    public var label: Label = Label()
    
    public var backgroundColor: UIColor = .black
    public var backgroundAlpha: CGFloat = 0.8
    public var cornerRadius: CGFloat = 6
    
    public struct Label {
        public var textColor: UIColor = .white
        public var font: UIFont = UIFont.systemFont(ofSize: 14)
    }
    
    public struct Motion {
        public var enter: ToastEnter = .fadeIn
        public var exit: ToastExit = .fadeOut
        public var spring: ToastSpring = .none
        
        public init() {}
        
        public init(
                enter: ToastEnter,
                exit: ToastExit,
                spring: ToastSpring = .none
            ) {
            self.enter = enter
            self.exit = exit
            self.spring = spring
        }
    }
    
    public struct Icon {
        public let image: UIImage
        public let width: CGFloat
        
        public init(
                image: UIImage,
                width: CGFloat
            ) {
            self.image = image
            self.width = width
        }
    }
    
    public init() {}
    
    public init(
            backgroundColor: UIColor,
            backgroundAlpha: CGFloat,
            cornerRadius: CGFloat
        ) {
        
        self.backgroundColor = backgroundColor
        self.backgroundAlpha = backgroundAlpha
        self.cornerRadius = cornerRadius
    }
    
    public init(
            iconImage: UIImage,
            width: CGFloat
        ) {
        
        icon = Icon(image: iconImage, width: width)
    }
    
    public init(
            enter: ToastEnter,
            exit: ToastExit,
            spring: ToastSpring = .none
        ) {
        
        motion = Motion(enter: enter, exit: exit, spring: spring)
    }
    
    public init(
            textColor: UIColor,
            font: UIFont
        ) {
        
        label = Label(textColor: textColor, font: font)
    }
    
    public init(
            label: Label,
            motion: Motion,
            icon: Icon? = nil
        ) {
        
        self.label = label
        self.motion = motion
        self.icon = icon
    }
}
