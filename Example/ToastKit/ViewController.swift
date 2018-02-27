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
import ToastKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    
    let toasts = [
        "With Nothing",
        "With Center Position",
        "With Top Position",
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        /*
        // With Nothing
        Toast.makeText(self, text: "With Nothing")

        // With Center Position
        Toast.makeText(self, text: "With Center Position", position: .center)

        // With Top Position
        Toast.makeText(self, text: "With Top Position", position: .top)

        // With Normal Duration
        Toast.makeText(self, text: "With Normal Duration", duration: .normal, position: .top)

        // With Long Duration
        Toast.makeText(self, text: "With Long Duration", duration: .long)

        // With Custom Duration
        Toast.makeText(self, text: "With Custom Duration", duration: .custom(4.4), position: .center)

        // With Custom Insets
        Toast.makeText(self, text: "With Custom Inset", minimumInsets: UIEdgeInsets(top: 10, left: 100, bottom: 10, right: 100))

        // With Icon Attached: Short Text
        Toast.makeText(self, text: "With Icon Attached: Short Text", duration: .custom(3.6), position: .center, configuration: .init(iconImage: UIImage(named: "alarm")!, width: 44))
        
        // With Icon Attached: Long Text
        Toast.makeText(self, text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries", duration: .custom(3.6), position: .center, configuration: .init(iconImage: UIImage(named: "alarm")!, width: 44))
        
        // With Icon Attached: Short Text
        Toast.makeText(self, text: "With Icon Attached: Short Text", duration: .custom(3.6), position: .center, configuration: .init(iconImage: UIImage(named: "alarm")!, width: 44))
        
        //  With Flipping from Bottom and from Right
        Toast.makeText(self, text: "With Flipping from Bottom and to Right", position: .top, configuration: .init(enter: .flipFromBottom, exit: .flipFromRight))
        
        // With Flipping from Left and from Top
        Toast.makeText(self, text: "With Flipping from Left and to Top", position: .center, configuration: .init(enter: .flipFromLeft, exit: .flipFromTop))
    
        // With Sliding From Bottom and to Right (Hard Spring Effect)
        Toast.makeText(self, text: "With Sliding From Bottom and to Right ( Spring Effect )", duration: .custom(2.2), position: .center, configuration: .init(enter: .slideFromBottom, exit: .slideToRight, spring: .hard))
        
        // With Sliding From Left and to Top (Without Spring Effect)
        Toast.makeText(self, text: "With Sliding From Left and to Top ( Spring Effect )", duration: .custom(2.7), position: .center, configuration: .init(enter: .slideFromBottom, exit: .slideToTop, spring: .none))
 
        // With ScaleUp and Down Effect
        Toast.makeText(self, text: "With ScaleUp and Down Effect", duration: .short, position: .top, configuration: .init(enter: .scaleUp, exit: .scaleDown, spring: .medium))

        // Custom ToastConfiguration
        var config = ToastConfiguration()
        config.backgroundColor = .yellow
        config.backgroundAlpha = 1
        config.label.textColor = .black
        config.cornerRadius = 24
        config.icon = ToastConfiguration.Icon(image: UIImage(named: "alarm")!, width: 44)
        Toast.makeText(self, text: "With Icon Attached: Short Text", duration: .custom(3.6), position: .center, configuration: config)
        */
        
        // Image With Nothing
        //Toast.makeImage(self, image: UIImage(named: "abstract")!)
        
        // Image With Custom Position
        //Toast.makeImage(self, image: UIImage(named: "abstract")!, position: .center)
        
        // Image Size via setting minimuminsets
         Toast.makeImage(self, image: UIImage(named: "abstract")!, position: .top, minimumInsets: .init(top: 8, left: 80, bottom: 8, right: 80))
        
        // Image With Sliding Animation
        //Toast.ma
        
        
        
        
//        ToastConfiguration(backgroundColor: <#T##UIColor#>, backgroundAlpha: <#T##CGFloat#>, cornerRadius: <#T##CGFloat#>)
//
//        ToastConfiguration(enter: <#T##ToastEnter#>, exit: <#T##ToastExit#>)
//
//        ToastConfiguration(enter: <#T##ToastEnter#>, exit: <#T##ToastExit#>, spring: <#T##ToastSpring#>)
//
//        ToastConfiguration(iconImage: <#T##UIImage#>, width: <#T##CGFloat#>)
//
//        ToastConfiguration(label: <#T##ToastConfiguration.Label#>, motion: <#T##ToastConfiguration.Motion#>)
//
//        ToastConfiguration(textColor: <#T##UIColor#>, font: <#T##UIFont#>)
//
//        ToastConfiguration()
        

        
        
        
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ""
    }
}

