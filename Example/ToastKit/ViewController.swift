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
        Toast.makeText(self, text: "Hello~")
    }
}

