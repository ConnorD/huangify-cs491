//
//  SelectPhotoSegue.swift
//  Huangify
//
//  Created by Connor Denman on 3/26/15.
//  Copyright (c) 2015 Culture Engineers LLC. All rights reserved.
//

import UIKit

class SelectPhotoSegue: UIStoryboardSegue, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    override func perform() {
        let src = self.sourceViewController as! UIViewController
        let dst = self.destinationViewController as! UIViewController
        
        // open photo picker
        var imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        imagePickerController.allowsEditing = true
        src.presentViewController(imagePickerController, animated: true, completion: nil)
        
        //src.navigationController?.pushViewController(dst, animated: false)
//        UIView.transitionWithView(src.navigationController?.view, duration: 0.2, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: { () -> Void in
//            src.navigationController?.pushViewController(dst, animated: false)
//        }, completion:nil)
    }
}