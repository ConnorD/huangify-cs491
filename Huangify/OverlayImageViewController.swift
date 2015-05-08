//
//  OverlayImageViewController.swift
//  Huangify
//
//  Created by Connor Denman on 1/28/15.
//  Copyright (c) 2015 Culture Engineers LLC. All rights reserved.
//

import UIKit

class OverlayImageViewController: UIImageView, UIGestureRecognizerDelegate {
    
    var dragStartPositionRelativeToCenter : CGPoint?
    var selected : Bool?
    var lastRotation = CGFloat()
    
    func gestureRecognizer(UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
            return true
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        println("init coder")
    }
    
    override init(image: UIImage!) {
        super.init(image: image)
        self.userInteractionEnabled = true
        
        println("init image")
        selected = true
        self.drawBorder()
        
        multipleTouchEnabled = true
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "handlePan:"))
        addGestureRecognizer(UITapGestureRecognizer(target:self, action:"imageViewSelected:"))
        addGestureRecognizer(UIRotationGestureRecognizer(target: self, action: "handleRotation:"))
        addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: "handlePinch:"))

    }
    
    func deselectImageView() {
        selected = false
        layer.shadowOffset = CGSizeZero
        layer.shadowOpacity = 0.0
        layer.shadowRadius = 0
        layer.borderColor = UIColor.clearColor().CGColor
        layer.borderWidth = 0.0
    }
    
    func drawBorder() {
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.borderWidth = 2.0
    }
    
    func imageViewSelected(nizer: UITapGestureRecognizer!) {
        println("tap")
        // make the image view selected
        
        if selected == true {
            self.deselectImageView()
            selected = false
        } else {
            self.drawBorder()
            selected = true
        }
        
        //at top of class
        var window:UIWindow?
        
        if let viewControllers = window?.rootViewController?.childViewControllers {
            for viewController in viewControllers {
                if viewController.isKindOfClass(CanvasViewController) {
                    //let canvasVC : CanvasViewController = viewController as CanvasViewController
                    
//                    for overlay in viewController.view.subviews {
//                        if let overlayVC = overlay as? OverlayImageViewController {
//                            if overlayVC.selected == true {
//                                overlayVC
//                            }
//                        }
//                    }
                }
            }
        }
    }
    
    func handlePan(nizer: UIPanGestureRecognizer!) {
        println("Pan")
        
        if nizer.state == UIGestureRecognizerState.Began {
            let locationInView = nizer.locationInView(superview)
            dragStartPositionRelativeToCenter = CGPoint(x: locationInView.x - center.x, y: locationInView.y - center.y)
            
            layer.shadowOffset = CGSize(width: 0, height: 20)
            layer.shadowOpacity = 0.3
            layer.shadowRadius = 6
            
            return
        }
        
        if nizer.state == UIGestureRecognizerState.Ended {
            dragStartPositionRelativeToCenter = nil
            
            layer.shadowOffset = CGSize(width: 0, height: 3)
            layer.shadowOpacity = 0.5
            layer.shadowRadius = 2
            
            return
        }
        
        let locationInView = nizer.locationInView(superview)
        
        UIView.animateWithDuration(0.1) {
            self.center = CGPoint(x: locationInView.x - self.dragStartPositionRelativeToCenter!.x,
                y: locationInView.y - self.dragStartPositionRelativeToCenter!.y)
        }
    }
    
    func handleRotation(recognizer: UIRotationGestureRecognizer){
        println("rotate")
        
//        var lastRotation = CGFloat()
//        if(sender.state == UIGestureRecognizerState.Ended){
//            lastRotation = 0.0;
//        }
//        rotation = 0.0 - (lastRotation - sender.rotation)
//        var point = rotateRec.locationInView(rotateView)
//        var currentTrans = sender.view.transform
//        var newTrans = CGAffineTransformRotate(currentTrans, rotation)
//        sender.view.transform = newTrans
//        lastRotation = sender.rotation
        
        recognizer.view!.transform = CGAffineTransformRotate(recognizer.view!.transform, recognizer.rotation)
        recognizer.rotation = 0
    }
    
    func handlePinch(recognizer:UIPinchGestureRecognizer){
        recognizer.view!.transform = CGAffineTransformScale(recognizer.view!.transform, recognizer.scale, recognizer.scale)
        recognizer.scale = 1
    }
    
}