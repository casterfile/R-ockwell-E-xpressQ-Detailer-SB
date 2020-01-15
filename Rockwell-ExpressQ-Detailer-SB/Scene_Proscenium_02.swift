//
//  Scene_Proscenium_02.swift
//  Rockwell-ExpressQ-Detailer-SB
//
//  Created by tonyMac on 1/11/20.
//  Copyright © 2020 tonyMac. All rights reserved.
//

import UIKit

class Scene_Proscenium_02: UIViewController {
    let BackBtn = UIButton()
    let NextBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let IVbackground = UIImageView(image: #imageLiteral(resourceName: "Scene_Proscenium_02.png"))
        let frame = CGRect(x: -3, y: -3, width: self.view.frame.width  + 5, height: self.view.frame.height + 5)
        IVbackground.frame = frame
        view.addSubview(IVbackground)
        
        FuncBackBtn()
        FuncNextBtn()
        Swip()

    }
    
    func FuncBackBtn(){
       BackBtn.frame = CGRect(x: self.view.frame.size.width - 50, y: 10, width: 50, height: 50)
       BackBtn.backgroundColor = UIColor.clear
       BackBtn.addTarget(self, action: #selector(buttonBackBtn), for: .touchUpInside)
       view.addSubview(BackBtn)
    }

    @objc func buttonBackBtn(sender: UIButton!) {
      self.performSegue (withIdentifier: "Scene_Proscenium_01", sender: self)
    }
    
    func FuncNextBtn(){
        NextBtn.frame = CGRect(x: self.view.frame.size.width - 150, y: self.view.frame.size.height - 60, width: 100, height: 50)
       NextBtn.backgroundColor = UIColor.clear
       NextBtn.addTarget(self, action: #selector(buttonNextBtn), for: .touchUpInside)
       view.addSubview(NextBtn)
    }

    @objc func buttonNextBtn(sender: UIButton!) {
      //self.performSegue (withIdentifier: "Scene_Proscenium_03", sender: self)
    }
    
    func Swip(){
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
                        ChangeSence()
                case UISwipeGestureRecognizer.Direction.left:
                        print("Left swipe")
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
            
            self.performSegue (withIdentifier: "Scene_Proscenium_01", sender: self)
        }
}
