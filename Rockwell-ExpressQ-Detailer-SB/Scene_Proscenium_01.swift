//
//  Scene_Proscenium_01.swift
//  Rockwell-ExpressQ-Detailer-SB
//
//  Created by tonyMac on 1/11/20.
//  Copyright © 2020 tonyMac. All rights reserved.
//

import UIKit

class Scene_Proscenium_01: UIViewController {
     let AboutBtn = UIButton()
     let UnitTypeBtn = UIButton()
     let AmenitiesBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let IVbackground = UIImageView(image: #imageLiteral(resourceName: "Scene_Proscenium_01.png"))
        let frame = CGRect(x: -3, y:-3, width: self.view.frame.width + 5 , height: self.view.frame.height + 5)
        IVbackground.frame = frame
        view.addSubview(IVbackground)
        
        FuncAbout()
        

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
    
    func FuncAbout(){
       
        AboutBtn.frame = CGRect(x: 50, y: self.view.frame.size.height - 200 , width: 200, height: 50)
        AboutBtn.backgroundColor = UIColor.clear
        AboutBtn.addTarget(self, action: #selector(buttonAboutBtn), for: .touchUpInside)
        view.addSubview(AboutBtn)
        
        UnitTypeBtn.frame = CGRect(x: 50, y: self.view.frame.size.height - 100 , width: 200, height: 50)
        UnitTypeBtn.backgroundColor = UIColor.clear
        UnitTypeBtn.addTarget(self, action: #selector(buttonUnitTypeBtn), for: .touchUpInside)
        view.addSubview(UnitTypeBtn)
        
        
        AmenitiesBtn.frame = CGRect(x: self.view.frame.size.width - 250, y: self.view.frame.size.height - 100 , width: 200, height: 50)
        AmenitiesBtn.backgroundColor = UIColor.clear
        AmenitiesBtn.addTarget(self, action: #selector(buttonAmenitiesBtn), for: .touchUpInside)
        view.addSubview(AmenitiesBtn)
    }
    
    @objc func buttonAboutBtn(sender: UIButton!) {
       self.performSegue (withIdentifier: "Scene_Proscenium_02", sender: self)
    }
    
    @objc func buttonUnitTypeBtn(sender: UIButton!) {
       self.performSegue (withIdentifier: "Scene_Proscenium_04", sender: self)
    }
    
    @objc func buttonAmenitiesBtn(sender: UIButton!) {
       self.performSegue (withIdentifier: "Scene_Proscenium_03", sender: self)
    }

    func hideStageButton(){
        if(isGlobal == false && isGlobalYESNO == false){
            AboutBtn.isHidden = false
        }
        else{
            AboutBtn.isHidden = true
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
           self.performSegue (withIdentifier: "Scene02", sender: self)
        }
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

        hideStageButton()
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
