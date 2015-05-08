//
//  OverlayPickerViewController.swift
//  Huangify
//
//  Created by Connor Denman on 1/28/15.
//  Copyright (c) 2015 Culture Engineers LLC. All rights reserved.
//

import UIKit

class OverlayPickerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tView : UITableView!
    let overlayFiles : [String] = ["antenae", "banana", "bandaid", "brokenheart2", "catboots", "catpolka", "colander2", "cone", "cucumber", "devilhorns", "disease", "fire", "fireblue", "fireblueglow", "fireglow", "gloveleft", "gloveright", "gravyboat", "halo", "halo2", "hammer", "heart2", "heartblack", "heartblackbroken", "heartpink", "heartpinkbroken", "heartred", "heartredbroken", "heartspace", "iciclescartoon", "iciclespixel", "knight", "lighteningbolt", "menacingbear2", "mouth1", "mouth2", "piratesword2", "popcorn2", "rocketpop2", "safetypin", "sockleft", "sockright", "spatula2", "taco2", "tape", "unicornfrolic", "unicornhead", "unicornrainbow", "vampiremouth", "yellingmouth"]
    
    @IBOutlet var canvasView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelPicker(sender: UIButton) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return overlayFiles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = self.tView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel?.text = self.overlayFiles[indexPath.row]
        cell.imageView?.image = UIImage(named: overlayFiles[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
        //let parent : CanvasViewController = self.parentViewController as CanvasViewController
        let parentVC = self.presentingViewController as! CanvasViewController
        //parentVC.canvasImageView?.image = UIImage(named: overlayFiles[indexPath.row])
        let overlayView : OverlayImageViewController = OverlayImageViewController(image: UIImage(named: overlayFiles[indexPath.row])) as OverlayImageViewController
//        overlayView.frame = CGRectMake(randomInt(10, max: parentVC.canvasImageView?.frame.width), randomInt(10, max: parentVC.canvasImageView?.frame.height), randomInt(50, max: 150), 150)
        //let x : CGFloat = CGFloat(self.randomInt(min: 10, max: parentVC.canvasImageView?.frame.width))
        overlayView.frame = CGRectMake(50, 50, 100, 100)
        parentVC.overlayImageViews?.append(overlayView)
        parentVC.selectedOverlay = parentVC.overlayImageViews!.count - 1
        parentVC.canvasImageView?.addSubview(overlayView)
        
        parentVC.deleteButton?.hidden = false
        
        for overlay in parentVC.canvasImageView!.subviews {
            if let overlayVC = overlay as? OverlayImageViewController {
                if overlayVC.selected == true {
                    overlayVC.deselectImageView()
                }
            }
            
            //overlay.removeFromSuperview()
        }
        
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
}