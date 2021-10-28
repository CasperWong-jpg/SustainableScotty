//
//  LogInViewController.swift
//  SustainableScotty
//
//  Created by Sophia Lau on 10/3/21.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
    }
    func setUpElements(){
        errorLabel.alpha = 0
        emailTextField.circleCorner()
        passwordTextField.circleCorner()
        loginButton.circleCorner()
    }
    
    func transitionToHome(){
           let homeViewController = storyboard?.instantiateViewController(identifier: "HomeVC") as? UITabBarController
           
           view.window?.rootViewController = homeViewController
           view.window?.makeKeyAndVisible()
    }
    
    func validateFields() -> String?{
        // Check all fields are filled
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        return nil
    }
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginTapped(_ sender: Any) {
        // Validate Text Fields
        let error = self.validateFields()
        
        if error != nil {
            showError(error!)
        } else {
            // Create clean versions of text fields
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            // Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if error != nil{
                    self.errorLabel.text = error!.localizedDescription
                    self.errorLabel.alpha = 1
                } else {
                    
                    self.transitionToHome()
                }
            }
        }
    }
    
}
