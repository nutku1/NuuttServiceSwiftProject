//
//  ViewController.swift
//  NuutService
//
//  Created by TST-APP-01 on 15/1/2562 BE.
//  Copyright © 2562 Nuutt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    Explicit
    var user:String?
    var password:String?
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func myAlert(title:String,message:String) -> Void {
        let objAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        objAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
        present(objAlert, animated: true, completion: nil)
        
    }
    
    func checkAuthen(user:String,password:String) -> Void {
        let myConstant = MyConstant()
        let urlString:String = myConstant.getUrlGetUser(user: user)
        print("urlString ==> \(urlString)")
        
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        user = userTextField.text
        password = passwordTextField.text
        
        if (user!.count == 0) || (password!.count == 0) {
            myAlert(title: "Have Space", message: "Please Fill All Blank")
            print("HAVE SPACE")
//            HAVE SPACE
        }else{
            print("NO SPACE")
//            NO SPACE
            checkAuthen(user: user!, password: password!)
        }
        
        
        
    }
    
}

