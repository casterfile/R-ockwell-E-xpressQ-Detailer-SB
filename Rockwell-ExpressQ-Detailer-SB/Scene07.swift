//
//  Scene07.swift
//  Rockwell-ExpressQ-Detailer-SB
//
//  Created by tonyMac on 1/12/20.
//  Copyright © 2020 tonyMac. All rights reserved.
//

import UIKit

class Scene07: UIViewController, UITextFieldDelegate {
    
    let FirstName =  UITextField(frame: CGRect(x: 90, y: 230, width: 300, height: 40))
    let LastName =  UITextField(frame: CGRect(x: 90, y: 340, width: 300, height: 40))
    let Address =  UITextField(frame: CGRect(x: 90, y: 440, width: 300, height: 40))
    let Email =  UITextField(frame: CGRect(x: 90, y: 550, width: 300, height: 40))
    let ContactNo =  UITextField(frame: CGRect(x: 90, y: 650, width: 300, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let IVbackground = UIImageView(image: #imageLiteral(resourceName: "Scene07.png"))
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width , height: self.view.frame.height)
        IVbackground.frame = frame
        view.addSubview(IVbackground)
        
        //Creating Text Field
        FirstName.placeholder = "First Name"
        //sampleTextField.font = UIFont.systemFont(ofSize: 23)
        //sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        FirstName.font = UIFont(name:"MinionPro-Regular",size:23)
        FirstName.autocorrectionType = UITextAutocorrectionType.no
        FirstName.keyboardType = UIKeyboardType.default
        FirstName.returnKeyType = UIReturnKeyType.done
        FirstName.clearButtonMode = UITextField.ViewMode.whileEditing
        FirstName.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        FirstName.delegate = self
        self.view.addSubview(FirstName)
        
        
        LastName.placeholder = "Last Name"
        LastName.font = UIFont(name:"MinionPro-Regular",size:23)
        LastName.autocorrectionType = UITextAutocorrectionType.no
        LastName.keyboardType = UIKeyboardType.default
        LastName.returnKeyType = UIReturnKeyType.done
        LastName.clearButtonMode = UITextField.ViewMode.whileEditing
        LastName.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        LastName.delegate = self
        self.view.addSubview(LastName)
        
        
        Address.placeholder = "Address"
        Address.font = UIFont(name:"MinionPro-Regular",size:23)
        Address.autocorrectionType = UITextAutocorrectionType.no
        Address.keyboardType = UIKeyboardType.default
        Address.returnKeyType = UIReturnKeyType.done
        Address.clearButtonMode = UITextField.ViewMode.whileEditing
        Address.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        Address.delegate = self
        self.view.addSubview(Address)
        
        
        Email.placeholder = "Email"
        Email.font = UIFont(name:"MinionPro-Regular",size:23)
        Email.autocorrectionType = UITextAutocorrectionType.no
        Email.keyboardType = UIKeyboardType.emailAddress
        Email.returnKeyType = UIReturnKeyType.done
        Email.clearButtonMode = UITextField.ViewMode.whileEditing
        Email.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        Email.delegate = self
        self.view.addSubview(Email)
        
        
        
        ContactNo.placeholder = "Contact No."
        ContactNo.font = UIFont(name:"MinionPro-Regular",size:23)
        ContactNo.autocorrectionType = UITextAutocorrectionType.no
        ContactNo.keyboardType = UIKeyboardType.decimalPad
        ContactNo.returnKeyType = UIReturnKeyType.done
        ContactNo.clearButtonMode = UITextField.ViewMode.whileEditing
        ContactNo.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        ContactNo.delegate = self
        self.view.addSubview(ContactNo)
        
        let SubmitForm = UIButton()
        SubmitForm.frame = CGRect(x: 80, y: self.view.frame.size.height - 230, width: 340, height: 100)
        SubmitForm.backgroundColor = UIColor.clear
        SubmitForm.addTarget(self, action: #selector(FuncSubmitForm), for: .touchUpInside)
        self.view.addSubview(SubmitForm)
        
//        for family: String in UIFont.familyNames
//        {
//            print("\(family)")
//            for names: String in UIFont.fontNames(forFamilyName: family)
//            {
//                   print("== \(names)")
//            }
//        }
        
        
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
    
    @objc func FuncSubmitForm(sender: UIButton!) {
        print("Submit Form")
        if(isGlobal == false && isGlobalYESNO == false){
            if(FirstName.text != "" && LastName.text != "" && Address.text != "" && Email.text != "" && ContactNo.text != ""){
                self.performSegue (withIdentifier: "Home", sender: self)
            }
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
              
          }
          
      @objc func FuncGlobalMenuContact(sender: UIButton!) {
          strWhatSceneToGo = "Contact"
         if(strWhatSceneToGo == "Contact"){
            //self.performSegue (withIdentifier: "Scene07", sender: self)
         }
          print("Contact")
         OnOffMenu ()
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
