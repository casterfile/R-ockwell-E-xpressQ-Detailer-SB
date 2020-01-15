//
//  ViewController.swift
//  Rockwell-ExpressQ-Detailer-SB
//
//  Created by tonyMac on 1/10/20.
//  Copyright © 2020 tonyMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let IVbackground = UIImageView(image: #imageLiteral(resourceName: "Scene01.png"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SwipeController();
    }
    //This is all the swiping Start
    func SwipeController(){
        
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width + 5 , height: self.view.frame.height + 5)
        IVbackground.frame = frame
        view.addSubview(IVbackground)
        

        let AboutBtn = UIButton()
        AboutBtn.frame = CGRect(x: 10, y: self.view.frame.size.height - 60 , width: 200, height: 50)
        AboutBtn.backgroundColor = UIColor.clear
        AboutBtn.addTarget(self, action: #selector(buttonAboutBtn), for: .touchUpInside)
        view.addSubview(AboutBtn)
        
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action:#selector(ViewController.respondToSwipeGesture(_:)) )
        swipeGestureRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view .addGestureRecognizer(swipeGestureRight)

        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeGestureLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeGestureLeft)

        let swipeGestureUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeGestureUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeGestureUp)

        let swipeGestureDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeGestureDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeGestureDown)
        
        

    }
    
    //Swiping Report Here
     @objc func respondToSwipeGesture(_ sender: UIGestureRecognizer) {
        if let swipeGesture = sender as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                    print("right swipe")
            case UISwipeGestureRecognizer.Direction.left:
                    ChangeSence()
            case UISwipeGestureRecognizer.Direction.up:
                    print("upSwipe")
            case UISwipeGestureRecognizer.Direction.down:
                    print("downSwipe")
                default:
                    break
            }
        }
    }
    
    //ChangeScene
    func ChangeSence(){
        print("leftSwipe")
        IVbackground.isHidden = false
//        UIView.transition(with: IVbackground, duration: 2, options: [.curveEaseInOut, .transitionCurlDown], animations: {
//        }, completion: {_ in})
        
        
        
        
        self.performSegue (withIdentifier: "Scene02", sender: self)
    }
    
    @objc func buttonAboutBtn(sender: UIButton!) {
       self.performSegue (withIdentifier: "Scene02", sender: self)
    }
    

}




