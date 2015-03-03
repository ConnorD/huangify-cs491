//
//  CanvasViewController.swift
//  Huangify
//
//  Created by Connor Denman on 1/28/15.
//  Copyright (c) 2015 Culture Engineers LLC. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {
    
    @IBOutlet weak var topView : UIView?
    @IBOutlet weak var noSelectionView : UIView?
    @IBOutlet weak var selectionView : UIView?
    @IBOutlet weak var canvasImageView : UIImageView?
    @IBOutlet weak var saveButton : FUIButton?
    @IBOutlet weak var addOverlayButton : FUIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // no overlay currently selected
        noSelectionView?.hidden = false
        selectionView?.hidden = true
        
        
        // flat UI interface setup
        
        // save button
        saveButton?.buttonColor = UIColor.turquoiseColor()
        saveButton?.shadowColor = UIColor.greenSeaColor()
        saveButton?.shadowHeight = 3.0
        saveButton?.cornerRadius = 6.0
        saveButton?.titleLabel?.font = UIFont.boldFlatFontOfSize(16)
        saveButton?.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Normal)
        saveButton?.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Highlighted)
        
        // add overlay button
        addOverlayButton?.buttonColor = UIColor.turquoiseColor()
        addOverlayButton?.shadowColor = UIColor.greenSeaColor()
        addOverlayButton?.shadowHeight = 3.0
        addOverlayButton?.cornerRadius = 6.0
        addOverlayButton?.titleLabel?.font = UIFont.boldFlatFontOfSize(16)
        addOverlayButton?.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Normal)
        addOverlayButton?.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Highlighted)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveImage(sender: UIButton) {
        println("saveImage")
    }
    
    
}