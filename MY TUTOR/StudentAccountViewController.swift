//
//  StudentAccountViewController.swift
//  MY TUTOR
//
//  Created by PUNEET TOKHI on 12/2/16.
//  Copyright © 2016 Appmart. All rights reserved.
//

import UIKit

class StudentAccountViewController: UIViewController {

    @IBAction func createStudentAccountAction(_ sender: Any) {
        
        if self.emailTextField.text == "" || self.passwordTextField.text == "" || self.firstNameTextField.text == ""
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please fill all the required fields before proceeding...", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
            
        }
        
    }
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
