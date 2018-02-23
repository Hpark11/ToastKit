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

import Foundation

protocol Concised {
    var raw: String { get }
}

enum KeyPath {
    case color(Color)
    case position(Position)
    case transform(Transform)
    case translation(Translation)
    
    enum Color: String, Concised {
        case background = "backgroundColor"
        case border = "borderColor"
        
        var raw: String {
            return self.rawValue
        }
    }
    
    enum Position: String, Concised {
        case x = "position.x"
        case y = "position.y"
        
        var raw: String {
            return self.rawValue
        }
    }
    
    enum Transform: String, Concised {
        case scale = "transform.scale"
        case rotation = "transform.rotation"
        
        var raw: String {
            return self.rawValue
        }
    }
    
    enum Translation: String, Concised {
        case x = "translation.x"
        
        var raw: String {
            return self.rawValue
        }
    }
}
