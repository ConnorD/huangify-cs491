//
//  ViewController.swift
//  Huangify
//
//  Created by Connor Denman on 1/21/15.
//  Copyright (c) 2015 Culture Engineers LLC. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nextButton : UIButton?
    var selectedImage : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openPhotoPicker(sender: UIButton) {
        
        // open photo picker
        var imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePickerController.allowsEditing = true
        self.presentViewController(imagePickerController, animated: true, completion: nil)
        
        //src.navigationController?.pushViewController(dst, animated: false)
        //        UIView.transitionWithView(src.navigationController?.view, duration: 0.2, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: { () -> Void in
        //            src.navigationController?.pushViewController(dst, animated: false)
        //        }, completion:nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        self.selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //var tempImage:UIImage = editingInfo[UIImagePickerControllerOriginalImage] as UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
        
        // go to the canvas and set its canvas image
        performSegueWithIdentifier("showCanvas", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc : CanvasViewController = segue.destinationViewController as! CanvasViewController
        
        vc.passedImage = self.selectedImage
    }
}

