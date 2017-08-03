//
//  ViewController.swift
//  BigBang.Swift
//
//  Created by Yale Li on 2017/8/2.
//  Copyright © 2017年 ttpai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func bigbang(_ sender: UIButton) {
        let stringlist = sender.titleLabel?.text?.segment(PINSegmentationOptions.KeepSymbols);
        
        print(stringlist ?? "nofragment");
    }

}

