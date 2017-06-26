//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Melody Ann Seda Marotte on 6/26/17.
//  Copyright © 2017 Melody Ann Seda Marotte. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signUpWasPressed(_ sender: Any) {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameTextField.text
        //newUser.email = emailLabel.text
        newUser.password = passwordTextField.text
        
        
        //Make sure that password and username are set before calling this method
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                
                //let code = error
                
                print(error.localizedDescription)
                
                var message: String = ""
                
                
                if ((newUser.username?.isEmpty)! || (newUser.password?.isEmpty)!){
                    message = "Empty field. Please input all information."
                } else {
                    message = "General error."
                }
                
                let MYalertController = UIAlertController(title: "Sign in Error", message: message, preferredStyle: .alert)
                
                // create a cancel action
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                    print("error within here")
                }
                // add the cancel action to the alertController
                MYalertController.addAction(cancelAction)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                MYalertController.addAction(OKAction)
                
                self.present(MYalertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
                
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
            }
        }
        
        
        
    }
    
    
    @IBAction func loginWasPressed(_ sender: Any) {
        
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
                
                var message: String = ""
                
                if ((username.isEmpty) || (password.isEmpty)){
                    message = "Empty field. Please input all information."
                } else {
                    message = "General error."
                }
                
                let MYalertController = UIAlertController(title: "Login Error", message: message, preferredStyle: .alert)
                
                // create a cancel action
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                    // handle cancel response here. Doing nothing will dismiss the view.
                    print("error within here")
                }
                // add the cancel action to the alertController
                MYalertController.addAction(cancelAction)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                MYalertController.addAction(OKAction)
                
                self.present(MYalertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
            }
        }
        
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
