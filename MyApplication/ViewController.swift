//
//  ViewController.swift
//  MyApplication
//
//  Created by Rodner Raymundo on 4/12/16.
//  Copyright © 2016 Rodner Raymundo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var avatarImage: UIImageView!
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var loginService = LoginService()
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.layer.borderWidth = 1.0
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.borderColor = UIColor.whiteColor().CGColor
        avatarImage.layer.cornerRadius = 70
        avatarImage.clipsToBounds = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(sender: AnyObject) {
        if usernameTextField.text == "" && passwordTextField.text == "" {
            self.displayMessage("Username or password is empty")
        } else {
            loginService.authenticate(usernameTextField.text!, password: passwordTextField.text!, completionHandler: { responseObject in
                if  responseObject!["error"] != nil {
                    self.displayMessage(responseObject!["error"] as! String)
                } else {
                    self.displayMessage(responseObject!["message"] as! String)
                }
            })
        }
    }
    
    func  displayMessage(message: String){
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}

