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
    
    var currentRow = 0
    
    let toasts = [
        "With Nothing",
        "With Center Position",
        "With Top Position",
        "With Normal Duration",
        "With Long Duration",
        "With Custom Duration",
        "With Custom Insets",
        "With Icon Attached: Short Text",
        "With Icon Attached: Long Text",
        "With Icon Attached: Short Text",
        "With Flipping from Bottom and from Right",
        "With Flipping from Left and from Top",
        "With Sliding From Bottom and to Right (Hard Spring Effect)",
        "With Sliding From Left and to Top (Without Spring Effect)",
        "With ScaleUp and Down Effect",
        "Custom ToastConfiguration",
        "Image With Nothing",
        "Image With Custom Position",
        "Image Size via setting minimuminsets",
        "Image With Sliding Animation",
        "Custom View"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        switch currentRow {
            case 0:
                // With Nothing
                Toast.makeText(self, text: "With Nothing")
            case 1:
                // With Center Position
                Toast.makeText(self, text: "With Center Position", position: .center)
            case 2:
                // With Top Position
                Toast.makeText(self, text: "With Top Position", position: .top)
            case 3:
                // With Normal Duration
                Toast.makeText(self, text: "With Normal Duration", duration: .normal, position: .top)
            case 4:
                // With Long Duration
                Toast.makeText(self, text: "With Long Duration", duration: .long)
            case 5:
                // With Custom Duration
                Toast.makeText(self, text: "With Custom Duration", duration: .custom(4.4), position: .center)
            case 6:
                // With Custom Insets
                Toast.makeText(self, text: "With Custom Inset", minimumInsets: UIEdgeInsets(top: 10, left: 100, bottom: 10, right: 100))
            case 7:
                // With Icon Attached: Short Text
                Toast.makeText(self, text: "With Icon Attached: Short Text", duration: .custom(3.6), position: .center, configuration: .init(iconImage: UIImage(named: "alarm")!, width: 44))
            case 8:
                // With Icon Attached: Long Text
                Toast.makeText(self, text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries", duration: .custom(3.6), position: .center, configuration: .init(iconImage: UIImage(named: "alarm")!, width: 44))
            case 9:
                // With Icon Attached: Short Text
                Toast.makeText(self, text: "With Icon Attached: Short Text", duration: .custom(3.6), position: .center, configuration: .init(iconImage: UIImage(named: "alarm")!, width: 44))
            case 10:
                //  With Flipping from Bottom and from Right
                Toast.makeText(self, text: "With Flipping from Bottom and to Right", position: .top, configuration: .init(enter: .flipFromBottom, exit: .flipFromRight))
            case 11:
                // With Flipping from Left and from Top
                Toast.makeText(self, text: "With Flipping from Left and to Top", position: .center, configuration: .init(enter: .flipFromLeft, exit: .flipFromTop))
            case 12:
                // With Sliding From Bottom and to Right (Hard Spring Effect)
                Toast.makeText(self, text: "With Sliding From Bottom and to Right ( Spring Effect )", duration: .custom(2.2), position: .center, configuration: .init(enter: .slideFromBottom, exit: .slideToRight, spring: .hard))
            case 13:
                // With Sliding From Left and to Top (Without Spring Effect)
                Toast.makeText(self, text: "With Sliding From Left and to Top ( Without Spring Effect )", duration: .custom(2.7), position: .center, configuration: .init(enter: .slideFromLeft, exit: .slideToTop, spring: .none))
            case 14:
                // With ScaleUp and Down Effect
                Toast.makeText(self, text: "With ScaleUp and Down Effect", duration: .short, position: .top, configuration: .init(enter: .scaleUp, exit: .scaleDown, spring: .medium))
            case 15:
                // Custom ToastConfiguration
                var config = ToastConfiguration()
                config.backgroundColor = .yellow
                config.backgroundAlpha = 1
                config.label.textColor = .black
                config.cornerRadius = 24
                config.icon = ToastConfiguration.Icon(image: UIImage(named: "alarm")!, width: 44)
                Toast.makeText(self, text: "With Icon Attached: Short Text", duration: .custom(3.6), position: .center, configuration: config)
            case 16:
                // Image With Nothing
                Toast.makeImage(self, image: UIImage(named: "abstract")!)
            case 17:
                // Image With Custom Position
                Toast.makeImage(self, image: UIImage(named: "abstract")!, position: .center)
            case 18:
                // Image Size via setting minimuminsets
                Toast.makeImage(self, image: UIImage(named: "abstract")!, position: .top, minimumInsets: .init(top: 8, left: 80, bottom: 8, right: 80))
            case 19:
                // Image With Sliding Animation
                Toast.makeImage(self, image: UIImage(named: "abstract")!, position: .top, minimumInsets: .init(top: 220, left: 80, bottom: 220, right: 80), configuration: .init(enter: .slideFromBottom, exit: .slideToTop, spring: .weak))
            case 20:
                // Custom View
                let custom = Bundle.main.loadNibNamed("CustomView", owner: nil, options: nil)?.first as! CustomView
                Toast.makeView(self, view: custom, position: .center, minimumInsets: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2), configuration: ToastConfiguration(enter: .slideFromBottom, exit: .slideToBottom))
            default:
                break
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return toasts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentRow = row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return toasts[row]
    }
}

