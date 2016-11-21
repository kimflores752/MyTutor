//
//  ViewController.swift
//  My Tutor
//
//  Created by PUNEET TOKHI on 11/19/16.
//  Copyright © 2016 Appmart. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseAuth

class ViewController: UIViewController, GIDSignInUIDelegate {
    
    
    @IBOutlet var logoutButton: UIButton!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var userNameLabel: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
              
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func createAccountAction(_ sender: Any) {
        
        if self.emailField.text == "" || self.passwordField.text == ""
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
            
        }
            
        else
        {
            FIRAuth.auth()?.createUser(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
                
                if error == nil
                {
                    self.logoutButton.alpha = 1.0
                    self.userNameLabel.text = user!.email
                    self.emailField.text = ""
                    self.passwordField.text = ""
                }
                    
                else
                {
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            })
        }
        

    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        if self.emailField.text == "" || self.passwordField.text == ""
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
            
        else
        {
            FIRAuth.auth()?.signIn(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
                
                if error == nil
                {
                    self.logoutButton.alpha = 1.0
                    self.userNameLabel.text = user!.email
                    self.emailField.text = ""
                    self.passwordField.text = ""
                }
                    
                else
                {
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                
                
            })
            
        }

    }
    
    
    @IBAction func logoutAction(_ sender: Any) {
        
        try! FIRAuth.auth()?.signOut()
        
        self.userNameLabel.text = ""
        self.logoutButton.alpha = 0.0
        self.emailField.text = ""
        self.passwordField.text = ""
    }
    
 
 /*
     @IBAction func logoutAction(_ sender: Any) {
     }
    
    @IBAction func loginAction(_ sender: Any) {
        
        
        if self.emailField.text == "" || self.passwordField.text == ""
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
            
        else
        {
            FIRAuth.auth()?.signIn(withEmail: self.emailField.text!, password: self.passwordField.text!, completion: { (user, error) in
                
                if error == nil
                {
                    self.logoutButton.alpha = 1.0
                    self.userNameLabel.text = user!.email
                    self.emailField.text = ""
                    self.passwordField.text = ""
                }
                    
                else
                {
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                
                
            })
            
        }
        
    }

    
    
    @IBAction func logoutAction(_ sender: Any) {
        
        try! FIRAuth.auth()?.signOut()
        
        self.userNameLabel.text = ""
        self.logoutButton.alpha = 0.0
        self.emailField.text = ""
        self.passwordField.text = ""
    }
 
 
 */

}
 


