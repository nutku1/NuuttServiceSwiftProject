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
        
        let urlObject = URL(string: urlString)
        let requestObject = NSMutableURLRequest(url: urlObject!)
        let task = URLSession.shared.dataTask(with: requestObject as URLRequest){data,response,error in
            
            if error != nil {
                print("Have Error")
            }else{
                if let testResult = data {
                    let canReadAble = NSString(data: testResult, encoding: String.Encoding.utf8.rawValue)
                    print("canReadAble ==> \(String(describing: canReadAble))")
                    DispatchQueue.main.async {
                        self.convertStringToDictionry(rawString: canReadAble! as String)
                    }
                }
            }
            
        }
        task.resume()
    } //END TASK
    
    func convertStringToDictionry(rawString:String) -> Void {
        print("rawString ==> \(rawString)")
        if rawString == "null" {
            myAlert(title: "ERROR", message: "Not Have User \(user!) In DATABASE")
        }else{
            let json:String = slipWord(rawString: rawString)
            print("json ==> \(json)")
            var myDictionary:NSDictionary?
            
            
            if let testJson = json.data(using: String.Encoding.utf8) {
                
                do {
                    myDictionary = try JSONSerialization.jsonObject(with: testJson, options: []) as? [String:AnyObject] as NSDictionary?
                    print("myDictionary ==> \(String(describing: myDictionary))")
                    
                    if let testDictionary = myDictionary {
                        print("testDictionary ==> \(testDictionary)")
                        let truePassword:String = testDictionary["Password"] as! String
                        
                        if password! == truePassword {
//                            SUCCESS LOGIN
                            performSegue(withIdentifier: "GoToService", sender: self)
                        }else{
                            myAlert(title: "ERROR", message: "Password not Correct Try Again")
                        }
                        
                    }
                    
                } catch let error as NSError{
                    print("Have Error \(error)")
                }
                
            } //IF
        } //IF
    } //Convert
    
    func slipWord(rawString:String) -> String {
        var results = rawString.components(separatedBy: "[")
        var results2 = results[1].components(separatedBy: "]")
        return results2[0]
    } //SlipWord
    
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
        
        
        
    }// Login Button
    
}

