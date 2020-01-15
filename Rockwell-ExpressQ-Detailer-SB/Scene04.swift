//
//  Scene04.swift
//  Rockwell-ExpressQ-Detailer-SB
//
//  Created by tonyMac on 1/12/20.
//  Copyright © 2020 tonyMac. All rights reserved.
//

import UIKit

class Scene04: UIViewController {
    var paybackLabel : UILabel = UILabel()
    var paybackSlider : UISlider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let IVbackground = UIImageView(image: #imageLiteral(resourceName: "Scene04.png"))
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height)
        IVbackground.frame = frame
        view.addSubview(IVbackground)
        
        paybackLabel = UILabel(frame: CGRect(x: 110, y: 550, width: 550, height: 50))
        paybackLabel.textAlignment = NSTextAlignment.center
        paybackLabel.font = UIFont(name:"MinionPro-Regular",size:45)
        paybackLabel.textColor = UIColor(red: 192.0/255.0, green: 165.0/255.0, blue: 101.0/255.0, alpha: 1.0)
        paybackLabel.text = "27M"
        self.view.addSubview(paybackLabel)
        
        //Creating Slider
        let slider = UISlider()
        slider.frame = CGRect(x: 0, y: 0, width: 550, height: 35)
        slider.center = self.view.center

        slider.minimumTrackTintColor = .clear
        slider.maximumTrackTintColor = .clear
        slider.thumbTintColor = UIColor(red: 192.0/255.0, green: 165.0/255.0, blue: 101.0/255.0, alpha: 1.0) //.brown

        slider.maximumValue = 50
        slider.minimumValue = 5
        slider.setValue(27, animated: false)

        slider.addTarget(self, action: #selector(changeVlaue(_:)), for: .valueChanged)

        self.view.addSubview(slider)
        
        BackNav()
        DoneNav()

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
    
    func  BackNav() {
        let BackButton = UIButton()
        BackButton.frame = CGRect(x: 20, y: 50, width: 100, height: 50)
        BackButton.backgroundColor = UIColor.clear
        BackButton.addTarget(self, action: #selector(BackNavAction), for: .touchUpInside)
        self.view.addSubview(BackButton)
    }
    
    func  DoneNav() {
        let DoneButton = UIButton()
        DoneButton.frame = CGRect(x: 210, y: self.view.frame.size.height - 220, width: 350, height: 90)
        DoneButton.backgroundColor = UIColor.clear
        DoneButton.addTarget(self, action: #selector(DoneNavAction), for: .touchUpInside)
        self.view.addSubview(DoneButton)
    }
    
    @objc func DoneNavAction(sender: UIButton!) {
        if( isGlobal == false)
        {
            print("Go Scene05")
            self.performSegue (withIdentifier: "Scene05", sender: self)
        }
    }
    
    @objc func changeVlaue(_ sender: UISlider) {
        print("value is" , Int(sender.value));
        var data = Int(sender.value)
        paybackLabel.text = "\(data)M"
    }
    
    @objc func BackNavAction(sender: UIButton!) {
        if( isGlobal == false)
        {
            print("Go Scene03")
            self.performSegue (withIdentifier: "Scene03", sender: self)
        }
    }
    
    
    

    func hideStageButton(){
         if(isGlobal == false && isGlobalYESNO == false){
//             AboutBtn.isHidden = false
         }
         else{
//             AboutBtn.isHidden = true
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
