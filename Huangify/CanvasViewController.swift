//
//  CanvasViewController.swift
//  Huangify
//
//  Created by Connor Denman on 1/28/15.
//  Copyright (c) 2015 Culture Engineers LLC. All rights reserved.
//

import UIKit

// extend UIView to take return its visual state as an image
extension UIView {
    
    func pb_takeSnapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.mainScreen().scale)
        
        drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        
        // old style: layer.renderInContext(UIGraphicsGetCurrentContext())
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

class CanvasViewController: UIViewController {
    
    @IBOutlet weak var topView : UIView?
    @IBOutlet weak var deleteButton : UIButton?
    @IBOutlet weak var canvasImageView : UIImageView?
    @IBOutlet weak var saveButton : UIButton?
    @IBOutlet weak var addOverlayButton : UIButton?
    var selectedOverlay : Int?
    var passedImage : UIImage?
    var overlayImageViews : [OverlayImageViewController]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // no overlay currently selected
        deleteButton?.hidden = true
        
        canvasImageView?.userInteractionEnabled = true
        canvasImageView?.multipleTouchEnabled = true
        canvasImageView?.image = passedImage
        
        overlayImageViews = [OverlayImageViewController]()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveImage(sender: UIButton) {
        for overlay in canvasImageView!.subviews {
            if let overlayVC = overlay as? OverlayImageViewController {
                overlayVC.deselectImageView()
            }
            
            //overlay.removeFromSuperview()
        }
        
        UIImageWriteToSavedPhotosAlbum(canvasImageView?.pb_takeSnapshot(), nil, nil, nil)
        
        UIAlertView(title: "Saved", message: "Your image has been saved.", delegate: nil, cancelButtonTitle: "Close").show()
        
        self.dismissViewControllerAnimated(false, completion: nil)
//        
//        let shareText:String = "Created with #Huangify"
//        let photo:UIImage? = canvasImageView?.pb_takeSnapshot()
//        let secondActivityItem : NSURL = NSURL(fileURLWithPath: "http://www.dvdowns.com/")!
//        
//        // let's add a String and an NSURL
//        //UIActivityViewController(
//        let activityViewController = UIActivityViewController(
//            activityItems: [shareText, photo.],
//            applicationActivities: nil)
//        self.presentViewController(activityViewController,
//            animated: true, 
//            completion: nil)
    }
    
    @IBAction func startOver(sender: UIButton) {
//        var startOverAlert = UIAlertController(title: "Start Over?", message: "The current photo will be scrapped.", preferredStyle: UIAlertControllerStyle.Alert)
//        
//        startOverAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
//            //self.dismissViewControllerAnimated(flag: false, completion: <#(() -> Void)?##() -> Void#>)
//        }))
//        
//        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
//            
//        }))
//        
//        presentViewController(refreshAlert, animated: true, completion: nil)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func deleteOverlay(sender: UIButton) {
        
        for overlay in canvasImageView!.subviews {
            if let overlayVC = overlay as? OverlayImageViewController {
                if overlayVC.selected == true {
                    overlay.removeFromSuperview()
                }
            }
            
            //overlay.removeFromSuperview()
        }
    }
    
}