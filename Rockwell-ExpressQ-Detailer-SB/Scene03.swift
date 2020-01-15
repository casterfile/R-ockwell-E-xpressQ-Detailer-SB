//
//  Scene03.swift
//  Rockwell-ExpressQ-Detailer-SB
//
//  Created by tonyMac on 1/10/20.
//  Copyright © 2020 tonyMac. All rights reserved.
//

import UIKit

class Scene03: UIViewController {
    
    let btnLease = UIButton()
    let btnBuy = UIButton()
    
    override func viewDidLoad() {
    super.viewDidLoad()
        let IVbackground = UIImageView(image: #imageLiteral(resourceName: "Scene03.png"))
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height)
        IVbackground.frame = frame
        view.addSubview(IVbackground)
        
        
        BackNav()
        FuncbtnLease()
        FuncbtnBuy()
        
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
    
    //Backbutton
    func  BackNav() {
        let BackButton = UIButton()
        BackButton.frame = CGRect(x: 20, y: 50, width: 100, height: 50)
        BackButton.backgroundColor = UIColor.clear
        BackButton.addTarget(self, action: #selector(BackNavAction), for: .touchUpInside)
        self.view.addSubview(BackButton)
    }
    @objc func BackNavAction(sender: UIButton!) {
       if(isGlobal == false && isGlobalYESNO == false){
            print("Go Scene02")
            self.performSegue (withIdentifier: "Scene02", sender: self)
        }
    }
    
    func FuncbtnLease(){
       
        btnLease.frame = CGRect(x: 200, y: 470 , width: 400, height: 100)
        btnLease.backgroundColor = UIColor.clear
        btnLease.addTarget(self, action: #selector(buttonbtnLease), for: .touchUpInside)
        view.addSubview(btnLease)
    }
    
    func FuncbtnBuy(){
        
        btnBuy.frame = CGRect(x: 200, y: 600 , width: 400, height: 100)
        btnBuy.backgroundColor = UIColor.clear
        btnBuy.addTarget(self, action: #selector(buttonbtnBuy), for: .touchUpInside)
        view.addSubview(btnBuy)
    }
    
    @objc func buttonbtnLease(sender: UIButton!) {
       self.performSegue (withIdentifier: "Scene04", sender: self)
    }
    
    @objc func buttonbtnBuy(sender: UIButton!) {
       self.performSegue (withIdentifier: "Scene04", sender: self)
    }
    
     func hideStageButton(){
         if(isGlobal == false && isGlobalYESNO == false){
            btnLease.isHidden = false
            btnBuy.isHidden = false
         }
         else{
            btnLease.isHidden = true
            btnBuy.isHidden = true
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
        if(strWhatSceneToGo == "Home"){
           self.performSegue (withIdentifier: "Home", sender: self)
        }

        if(strWhatSceneToGo == "Properties"){
           self.performSegue (withIdentifier: "Scene02", sender: self)
        }

        if(strWhatSceneToGo == "Contact"){
           self.performSegue (withIdentifier: "Scene07", sender: self)
        }
    }
    
    @objc func FuncGlobalMenuContact(sender: UIButton!) {
        strWhatSceneToGo = "Contact"
        YesNoFunc()
        OnOffMenu ()
        print("Contact")
    }
    
    @objc func FuncGlobalMenuProperties(sender: UIButton!) {
        strWhatSceneToGo = "Properties"
        YesNoFunc()
        OnOffMenu ()
        print("Properties")
    }
    
    @objc func FuncGlobalMenuHome(sender: UIButton!) {
        strWhatSceneToGo = "Home"
        YesNoFunc()
        OnOffMenu ()
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
