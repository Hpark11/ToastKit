//
//  ViewController.swift
//  ToastKit
//
//  Created by hpark11 on 02/20/2018.
//  Copyright (c) 2018 hpark11. All rights reserved.
//

import UIKit
import ToastKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Toast.m
        
        //Toast.printSomeThing()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
//        let loader = UIActivityIndicatorView()
//        loader.backgroundColor = .red
//        loader.bounds.size = CGSize(width: 100, height: 100)
//        loader.startAnimating()
        let imageView = UIImageView(image: UIImage(named: "abstract"))
        imageView.contentMode = .scaleAspectFill
        
        let custom = Bundle.main.loadNibNamed("CustomView", owner: nil, options: nil)?.first as! CustomView
        custom.isHidden = false
        
        view.addSubview(custom)
        Toast.makeView(self, view: custom)
        //Toast.makeText(self, text: "Hello~")
        //Toast.makeText(self, text: "Goody", duration: .normal, position: .center, configuration: ToastConfiguration(enter: .fadeIn, exit: .curlUp))
        Toast.makeImage(self, image: UIImage(named: "abstract")!, position: .center, minimumInsets: UIEdgeInsets(top: 40, left: 2, bottom: 40, right: 2), configuration: ToastConfiguration(enter: .flipFromLeft, exit: .flipFromBottom))
        Toast.makeText(self, text: "LIBEROawjkejqwkhejqwerwerwerwerwerwerqwjelkqjwelkqwjeklqwjelkqwjeklqwkleqjwkejqklwjeklqwjeklqwjelkqwjlekjqwlkejqwlkejqwlkejqwlkejlqwkjelkqwjelkqwjeklqwjekljqwlkejqwlkejqkwlejlkqwjelkqwjelkqwjelkqwjelkqwj", duration: .long, position: .top, minimumInsets: UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2), configuration: ToastConfiguration(enter: .flipFromTop, exit: .flipFromRight))
    }
}

