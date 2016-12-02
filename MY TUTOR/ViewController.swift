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

class ViewController: UIViewController, GIDSignInUIDelegate, UITextFieldDelegate {
    
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var createAccountLabel: UIButton!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var labelOR: UILabel!
    
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var emailField: UITextField!
   
    
    @IBOutlet var logoutButton: UIButton!
    
    
    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var signOutButton: UIButton!
    @IBOutlet var signInButton: GIDSignInButton!
    
    

   
    
    @IBAction func signOutWasPressed(_ sender: Any) {
        
        GIDSignIn.sharedInstance().signOut()
    }
    
    
  /*  func refreshInter(){
        
        if let tempUser = GIDSignIn.sharedInstance().currentUser {
            
           signInButton.isHidden =  true
           signOutButton.isHidden = false
            self.emailField.alpha = 0.0
            self.passwordField.alpha = 0.0
            self.createAccountLabel.alpha = 0.0
            self.labelOR.alpha = 0.0
            self.logInButton.alpha = 0.0
            self.userNameLabel.text = "\(tempUser.profile.name!)"
    
            
            let profilePicURL = tempUser.profile.imageURL(withDimension: 175)
            profilePic.image = UIImage(data: NSData(contentsOf: profilePicURL!)! as Data)
            profilePic.isHidden = false
            
        }
        
        else{
            
            signInButton.isHidden = false
            signOutButton.isHidden = false
            self.userNameLabel.text = "Welcome to My Tutor!"
           self.profilePic.image = nil
            profilePic.isHidden = true
            
        }
        
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        self.labelOR.alpha = 1.0
        self.logoutButton.alpha = 0.0
      
        
        
        
        
     
     //  self.view.backgroundColor = UIColor(patternImage: UIImage(named: "url.jpg")!)

        
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        
    }
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
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
                    self.logInButton.alpha = 0.0
                    self.createAccountLabel.alpha = 0.0
                    self.userNameLabel.text = "Waiting for E-mail verification..."
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
        
        self.userNameLabel.text = "Welcome to my Tutor!"
        self.createAccountLabel.alpha = 1.0
        self.logInButton.alpha = 1.0
        self.labelOR.alpha = 0.0
        self.logoutButton.alpha = 0.0
        self.signOutButton.alpha = 1.0
        self.emailField.text = ""
        self.passwordField.text = ""
        
    }
    
 
 /*
     
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
 


