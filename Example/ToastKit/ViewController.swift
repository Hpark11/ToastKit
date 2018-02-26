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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
//        let loader = UIActivityIndicatorView()
//        loader.backgroundColor = .red
//        loader.bounds.size = CGSize(width: 100, height: 100)
//        loader.startAnimating()
        //Toast.makeText(self, text: "LIBERO", configuration: ToastConfiguration(enter: .curlDown, exit: .curlUp))

        var toast = ToastConfiguration()
        toast.backgroundColor = UIColor.black

        let imageView = UIImageView(image: UIImage(named: "alarm"))
        imageView.contentMode = .scaleAspectFill

        let custom = Bundle.main.loadNibNamed("CustomView", owner: nil, options: nil)?.first as! CustomView
        custom.isHidden = false

        view.addSubview(custom)
        Toast.makeView(self, view: custom, minimumInsets: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2), configuration: ToastConfiguration(enter: .slideFromBottom, exit: .slideToBottom))
        Toast.makeText(self, text: "Hello~")
        Toast.makeText(self, text: "Goody", duration: .normal, position: .center, configuration: ToastConfiguration(enter: .fadeIn, exit: .curlUp))
        Toast.makeImage(self, image: UIImage(named: "alarm")!, position: .center, minimumInsets: UIEdgeInsets(top: 80, left: 78, bottom: 80, right: 78), configuration: ToastConfiguration(enter: .slideFromLeft, exit: .slideToLeft))
        Toast.makeText(self, text: "LIBEROawjkejqwkhejqwerwerwerwerwerwerqwjelkqjwelkqwjeklqwjelkqwjeklqwkleqjwkejqklwjeklqwjeklqwjelkqwjlekjqwlkejqwlkejqwlkejqwlkejlqwkjelkqwjelkqwjeklqwjekljqwlkejqwlkejqkwlejlkqwjelkqwjelkqwjelkqwjelkqwj", duration: .long, position: .top, minimumInsets: UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2), configuration: ToastConfiguration(enter: .flipFromBottom, exit: .flipFromRight))
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

