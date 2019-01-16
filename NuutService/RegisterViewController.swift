//
//  RegisterViewController.swift
//  NuutService
//
//  Created by TST-APP-01 on 15/1/2562 BE.
//  Copyright © 2562 Nuutt. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

//    Explicit
    var name:String?
    var user:String?
    var password:String?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } //MAIN FUNCTION
    
    @IBAction func cloudUploadButton(_ sender: Any) {
//        Get value form TectFiled
        name = nameTextField.text
        user = userTextField.text
        password = passwordTextField.text
        
//        Call Show Log
        showlog(title: "Name ==>", message: name!)
        showlog(title: "User ==>", message: user!)
        showlog(title: "Password ==>", message: password!)
        
        
//        Call Check Space
        checkSpace(name: name!, user: user!, password: password!)
        
    } //CLOUD UPLOAD
    
    func myAlert(title:String,message:String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert,animated: true,completion: nil)
        
    } // FINCTION MY ALERT
    
    func checkSpace(name:String,user:String,password:String) -> Void {
        if (name.count == 0) || (user.count == 0) || (password.count == 0) {
//            Have Space
            showlog(title: "Result", message: "Have Space")
            myAlert(title: "Have Space", message: "Please Fill All Every Blank")
        }else{
//            No Space
            showlog(title: "Result", message: "No Space")
        }
    }
    
    func showlog(title:String,message:String) -> Void {
        print("\(title) \(message)")
    }
    
} // MAIN CLASS
