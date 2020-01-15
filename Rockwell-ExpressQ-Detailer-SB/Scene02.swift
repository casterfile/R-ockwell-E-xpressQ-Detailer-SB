//
//  Scene02.swift
//  Rockwell-ExpressQ-Detailer-SB
//
//  Created by tonyMac on 1/10/20.
//  Copyright © 2020 tonyMac. All rights reserved.
//

import UIKit

class Scene02: UIViewController,iCarouselDelegate , iCarouselDataSource {
    
    
    var x = 0
    var imageViewPub = UIImageView(image: #imageLiteral(resourceName: "Scene02_Item01.png"))
    let buttonImage = UIButton()
    
    let IVbackground = UIImageView(image: #imageLiteral(resourceName: "Scene02.png"))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Trans()
        
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height)
        IVbackground.frame = frame
        view.addSubview(IVbackground)
        
        
        
        //Creating Carousel
        let carousel = iCarousel(frame: CGRect(x: 50, y: 600, width: 400, height: 100))
        carousel.dataSource = self
//        carousel.type = .coverFlow
        carousel.type = .coverFlow2
        carousel.centerItemWhenSelected = true
        carousel.clipsToBounds = true
        carousel.bounds = CGRect(origin: CGPoint(x: 100,y: 100), size: CGSize(width:2000,height: 900));
        view.addSubview(carousel)
        
        
        
        //Create a Button Programming type
        let button = UIButton()
        button.frame = CGRect(x: 80, y: 150, width: 250, height: 100)
        button.backgroundColor = UIColor(white: 1, alpha: 0.0)
        //button.backgroundColor = UIColor.red
        //button.setTitle("Name your Button ", for: .normal)
        button.addTarget(self, action: #selector(buttonActionScene03), for: .touchUpInside)
        self.view.addSubview(button)
        
       
        
        buttonImage.frame = CGRect(x: 80, y: 150, width: 250, height: 100)
        buttonImage.backgroundColor = UIColor.red
        buttonImage.addTarget(self, action: #selector(buttonActionScene03), for: .touchUpInside)
        
//        Adding tap effect in the UI Image
        
        
       //GLobal Function and setting
       Detailes()
       GlobalMenuFunc()
       FuncYesOrNoDialog()
       MenuDetails.isHidden = true
       YesOrNoDialog.isHidden = true
       GlobalMenuYes.isHidden = true
       GlobalMenuNo.isHidden = true
       GlobalMenuHome.isHidden = true
       GlobalMenuProperties.isHidden = true
       GlobalMenuContact.isHidden = true
        
    }
    
    func Trans(){
        IVbackground.isHidden = false
        UIView.transition(with: self.view, duration: 2, options: [.curveEaseInOut, .transitionCurlDown], animations: {
        }, completion: {_ in})
        
        UIView.transition(with: self.view, duration: 0.325, options: .curveEaseInOut, animations: {

            // animation

        }) { finished in

            // completion

        }
    }
    
    


    func numberOfItems(in carousel: iCarousel) -> Int {
        return 5
    }

//    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
//        x += 1
//
//        let imageView: UIImageView
//
//
////        carousel.bounceDistance = CGFloat(signOf: 400, magnitudeOf: 400)
//         if view != nil {
//               imageView = view as! UIImageView
//           } else {
//               imageView = UIImageView(frame: CGRect(x: 400, y: 400, width: 400, height: 600))
//           }
//
//           imageView.image = UIImage(named: "Scene02_Item01")
//           imageViewPub.image = imageView.image
//
//
//           let button = UIButton(type: .custom)
//           button.frame = CGRect(x: 0, y: 0, width: 250, height: 100)
//           buttonImage.backgroundColor = UIColor.red
//           button.tag = carousel.currentItemIndex
//           button.addTarget(self, action: #selector(buttonNextAction), for: .touchUpInside)
//
//           buttonImage.addSubview(imageView)
//
//           return imageView
//
//        //print("first \(x)");
//
//    }
    

    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        x += 1

        var itemView = UIImageView()
        itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 600))


//        itemView.contentMode = .scaleToFill
//        itemView.backgroundColor = .clear
        //itemView.setBorder(color: .red, width: 2)

        let vwHeight = CGFloat(200)
        let btnHeight = CGFloat(100)
        let itemHeight = itemView.frame.size.height
        let itemWidth = itemView.frame.size.width
        let carouselX = CGFloat(30)

        let customBtnView = UIView()
        customBtnView.frame = CGRect(x: carouselX, y: itemHeight - vwHeight , width: itemWidth, height: vwHeight)

        customBtnView.backgroundColor = UIColor.blue //UIColor.clear





        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 400, y: 400, width: 400, height: 600)
        button.backgroundColor =  UIColor.clear//UIColor.red
        button.addSubview(itemView)
        if(x == 1){
            itemView.image = UIImage(named: "Scene02_Item01")
            button.tag = carousel.currentItemIndex
            button.addTarget(self, action: #selector(buttonNextAction), for: .touchUpInside)
            return button
        }
        else{
            itemView.image = UIImage(named: "Scene02_Item02")
            return itemView
//            return button
        }
    }

    
    @objc func buttonNextAction(sender: UIButton) {
        if(isGlobal == false && isGlobalYESNO == false){
            print("Scene_Proscenium_01")
            self.performSegue (withIdentifier: "Scene_Proscenium_01", sender: self)
        }
    }
    
    
    
    @objc func buttonActionScene03(sender: UIButton!) {
        if(isGlobal == false && isGlobalYESNO == false){
            print("Go Scene03")
            self.performSegue (withIdentifier: "Scene03", sender: self)
        }
    }
    
    
    //Global Menu Function
     var isGlobal = false
     var isGlobalYESNO = false
     let MenuDetails = UIImageView(image: #imageLiteral(resourceName: "MenuDetails.png"))
     let YesOrNoDialog = UIImageView(image: #imageLiteral(resourceName: "QuitYesOrNo.png"))
     let GlobalMenu = UIButton()
     let GlobalMenuX = UIButton()
     let GlobalMenuHome = UIButton()
     let GlobalMenuProperties = UIButton()
     let GlobalMenuContact = UIButton()
     
     let GlobalMenuYes = UIButton()
     let GlobalMenuNo = UIButton()
     
     var strWhatSceneToGo = ""
     
     func  GlobalMenuFunc() {
         
         GlobalMenu.frame = CGRect(x: self.view.frame.size.width - 50, y: 10, width: 50, height: 50)
         GlobalMenu.backgroundColor = UIColor.clear
         GlobalMenu.addTarget(self, action: #selector(buttonActionGlobal), for: .touchUpInside)
         view.addSubview(GlobalMenu)
         
     }
     
    @objc func buttonActionGlobal(sender: UIButton!) {
       print("Show Menu")
       OnOffMenu ()
    }
     
     func Detailes(){
         //Create a Button Programming type
         let frame = CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height)
         MenuDetails.frame = frame
         self.view.addSubview(MenuDetails)
         
         
         GlobalMenuX.frame = CGRect(x: self.view.frame.size.width - 50, y: 10, width: 50, height: 50)
         GlobalMenuX.backgroundColor = UIColor.clear
         GlobalMenuX.addTarget(self, action: #selector(FuncGlobalMenuX), for: .touchUpInside)
         view.addSubview(GlobalMenuX)
         
         
         GlobalMenuHome.frame = CGRect(x: 250, y: 200, width: 200, height: 50)
         GlobalMenuHome.backgroundColor = UIColor.clear
         GlobalMenuHome.addTarget(self, action: #selector(FuncGlobalMenuHome), for: .touchUpInside)
         view.addSubview(GlobalMenuHome)
         
         GlobalMenuProperties.frame = CGRect(x: 250, y: 270, width: 200, height: 50)
         GlobalMenuProperties.backgroundColor = UIColor.clear
         GlobalMenuProperties.addTarget(self, action: #selector(FuncGlobalMenuProperties), for: .touchUpInside)
         view.addSubview(GlobalMenuProperties)
         
         GlobalMenuContact.frame = CGRect(x: 250, y: 340, width: 260, height: 50)
         GlobalMenuContact.backgroundColor = UIColor.clear
         GlobalMenuContact.addTarget(self, action: #selector(FuncGlobalMenuContact), for: .touchUpInside)
         view.addSubview(GlobalMenuContact)
     }
     
     func FuncYesOrNoDialog(){
         let frame = CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height)
         YesOrNoDialog.frame = frame
         self.view.addSubview(YesOrNoDialog)
         
         GlobalMenuYes.frame = CGRect(x: 200, y: 470, width: 360, height: 100)
         GlobalMenuYes.backgroundColor = UIColor.clear
         GlobalMenuYes.addTarget(self, action: #selector(FuncGlobalMenuYes), for: .touchUpInside)
         view.addSubview(GlobalMenuYes)
         
         GlobalMenuNo.frame = CGRect(x: 200, y: 590, width: 360, height: 100)
         GlobalMenuNo.backgroundColor = UIColor.clear
         GlobalMenuNo.addTarget(self, action: #selector(FuncGlobalMenuNo), for: .touchUpInside)
         view.addSubview(GlobalMenuNo)
     }
     @objc func FuncGlobalMenuNo(sender: UIButton!) {
         print("NO NO")
         YesNoFunc()
         OnOffMenu ()
     }
     
      @objc func FuncGlobalMenuYes(sender: UIButton!) {
             print("YES YES")
             
         }
         
     @objc func FuncGlobalMenuContact(sender: UIButton!) {
         strWhatSceneToGo = "Contact"
        if(strWhatSceneToGo == "Contact"){
           self.performSegue (withIdentifier: "Scene07", sender: self)
        }
         print("Contact")
     }
     
     @objc func FuncGlobalMenuProperties(sender: UIButton!) {
         strWhatSceneToGo = "Properties"
        if(strWhatSceneToGo == "Properties"){
           //self.performSegue (withIdentifier: "Scene02", sender: self)
        }
        OnOffMenu ()
        print("Properties")
     }
     
     @objc func FuncGlobalMenuHome(sender: UIButton!) {
         strWhatSceneToGo = "Home"
        if(strWhatSceneToGo == "Home"){
           self.performSegue (withIdentifier: "Home", sender: self)
        }
         print("Home")
     }
     
     @objc func FuncGlobalMenuX(sender: UIButton!) {
        print("X Close")
         OnOffMenu ()
     }
     
     func OnOffMenu (){
         if(isGlobal == false){
             isGlobal = true
             MenuDetails.isHidden = false
             GlobalMenu.isHidden = true
             GlobalMenuX.isHidden = false
             GlobalMenuHome.isHidden = false
             GlobalMenuProperties.isHidden = false
             GlobalMenuContact.isHidden = false
         }else{
             isGlobal = false
             MenuDetails.isHidden = true
             GlobalMenu.isHidden = false
             GlobalMenuX.isHidden = true
             GlobalMenuHome.isHidden = true
             GlobalMenuProperties.isHidden = true
             GlobalMenuContact.isHidden = true
         }
     }
     
     func YesNoFunc(){
         if(isGlobalYESNO == false){
             isGlobalYESNO = true
             YesOrNoDialog.isHidden = false
             GlobalMenuYes.isHidden = false
             GlobalMenuNo.isHidden = false
         }else{
             isGlobalYESNO = false
             YesOrNoDialog.isHidden = true
             GlobalMenuYes.isHidden = true
             GlobalMenuNo.isHidden = true
         }
     }
}
