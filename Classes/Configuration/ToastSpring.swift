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

public enum ToastSpring {
    case none
    case weak
    case medium
    case hard
    
    internal static func damping(_ value: ToastSpring) -> CGFloat {
        switch value {
        case .none: return 100.0
        case .weak: return 12.0
        case .medium: return 10.0
        case .hard: return 8.0
        }
    }
    
    internal static func mass(_ value: ToastSpring) -> CGFloat {
        switch value {
        case .none: return 10.0
        case .weak: return 0.8
        case .medium: return 1.0
        case .hard: return 1.6
        }
    }
    
    internal static func stiffness(_ value: ToastSpring) -> CGFloat {
        switch value {
        case .none: return 150.0
        case .weak: return 250.0
        case .medium: return 100.0
        case .hard: return 200.0
        }
    }
    
    internal static func velocity(_ value: ToastSpring) -> CGFloat {
        switch value {
        case .none: return 1.0
        case .weak: return 0.0
        case .medium: return 0.0
        case .hard: return 0.4
        }
    }
}
