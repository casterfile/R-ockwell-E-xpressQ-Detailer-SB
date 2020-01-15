//
//  FadePushAnimator.swift
//  Rockwell-ExpressQ-Detailer-SB
//
//  Created by tonyMac on 1/13/20.
//  Copyright © 2020 tonyMac. All rights reserved.
//

import UIKit

class ScaleSegue: UIStoryboardSegue{
    override func perform(){
        scale()
    }
    
    func scale (){
        let toViewController = self.destination
        let fromViewController = self.source
        
        let containerView = fromViewController.view.superview
        let originalCenter = fromViewController.view.center
        
        toViewController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toViewController.view.center = originalCenter
        
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: {success in
            fromViewController.present(toViewController, animated: false, completion: nil)
        })
    }
}


class MoveLeftSegue: UIStoryboardSegue{
    override func perform(){
        MoveLeft()
    }
    
    func MoveLeft (){
        let toViewController = self.destination
        let fromViewController = self.source
        
        let containerView = fromViewController.view.superview
//        let originalCenter = fromViewController.view.
        
//        toViewController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toViewController.view.transform = CGAffineTransform(translationX: 1000, y: 0)
//        toViewController.view.leftAnchor = originalCenter
        
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: {success in
            fromViewController.present(toViewController, animated: false, completion: nil)
        })
    }
}

class MoveRightSegue: UIStoryboardSegue{
    override func perform(){
        MoveRight()
    }
    
    func MoveRight (){
        let toViewController = self.destination
        let fromViewController = self.source
        
        let containerView = fromViewController.view.superview
//        let originalCenter = fromViewController.view.
        
//        toViewController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toViewController.view.transform = CGAffineTransform(translationX: -1000, y: 0)
//        toViewController.view.leftAnchor = originalCenter
        
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: {success in
            fromViewController.present(toViewController, animated: false, completion: nil)
        })
    }
}


class NextPageSlidetSegue: UIStoryboardSegue{
    override func perform(){
        NextPageSlidet()
    }
    
    func NextPageSlidet (){
        var toViewController = self.destination
        let fromViewController = self.source
        
        let containerView = fromViewController.view.superview
//        toViewController.view.transform = CGAffineTransform(rotationAngle: -0.999 * CGFloat.pi)
        toViewController.view.transform = CGAffineTransform(translationX: 1000, y: 0)
        
//        toViewController.view.transform  = CGAffineTransform.identity.translatedBy(x: 100, y: 300).rotated(by: CGFloat.pi / 4).scaledBy(x: -1, y: 2)
        
//        toViewController.view.transform = CGAffineTransform.identity.translatedBy(x: 1000, y: 0).rotated(by: CGFloat.pi / 0.8)
        
        containerView?.addSubview(toViewController.view)
        
//        UIView.transition(with: toViewController.view, duration: 2, options: [.curveEaseInOut, .transitionCurlDown], animations: {
//            toViewController.view.transform = CGAffineTransform.identity
//        }, completion: {success in
//            fromViewController.present(toViewController, animated: false, completion: nil)
//        })
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut, .transitionCurlDown], animations: {
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: {success in
            fromViewController.present(toViewController, animated: false, completion: nil)
        })
        

        
    }
}
