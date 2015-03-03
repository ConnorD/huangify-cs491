//
//  ViewController.swift
//  Huangify
//
//  Created by Connor Denman on 1/21/15.
//  Copyright (c) 2015 Culture Engineers LLC. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var nextButton : FUIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set up the flat UI (not perfect yet)
        nextButton?.buttonColor = UIColor.turquoiseColor()
        nextButton?.shadowColor = UIColor.greenSeaColor()
        nextButton?.shadowHeight = 3.0
        nextButton?.cornerRadius = 6.0
        nextButton?.titleLabel?.font = UIFont.boldFlatFontOfSize(16)
        nextButton?.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Normal)
        nextButton?.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Highlighted)
//        nextButton?.titleLabel.
//        nextButton?.setTitleShadowColor(<#color: UIColor?#>, forState: <#UIControlState#>)
//        [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

