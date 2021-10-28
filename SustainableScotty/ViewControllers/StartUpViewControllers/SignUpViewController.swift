//
//  SignUpViewController.swift
//  SustainableScotty
//
//  Created by Sophia Lau on 10/3/21.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    @IBOutlet weak var selectCollege: UIButton!
    @IBOutlet weak var collegesTable: UITableView!
    
    @IBOutlet weak var selectGradYear: UIButton!
    @IBOutlet weak var yearsTable: UITableView!
    
    var collegesList = ["College of Engineering", "College of Fine Arts", "Dietrich College of Humanities & Social Sciences", "Heinz College of Information Systems and Public Policy", "Mellon College of Science", "School of Computer Science", "Tepper School of Business"]
    var yearsList = ["2024", "2023", "2022", "2021"]
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        setUpElements()
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        firstNameTextField?.circleCorner()
        lastNameTextField?.circleCorner()
        emailTextField?.circleCorner()
        passWordTextField?.circleCorner()
        selectCollege?.circleCorner()
        selectGradYear?.circleCorner()
        signUpButton.circleCorner()
        errorLabel.alpha = 0
        collegesTable.isHidden = true
        yearsTable.isHidden = true
    }
    
    func validateFields() -> String?{
        // Check all fields are filled
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passWordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "Please fill in all fields."
        }
        
        // Check if passwords is secure
        let cleanedPass = passWordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if !Helper.isPasswordValid(cleanedPass) {
            
            return "Please make sure your password has 8 characters, a special character and a number. "
        }
        
        return nil
    }
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }

    func transitionToHome(){
        let homeViewController = storyboard?.instantiateViewController(identifier: "HomeVC") as? UITabBarController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func selectCollegeClick(_ sender: Any) {
        UIView.animate(withDuration: 0.3){
            self.collegesTable.isHidden = !(self.collegesTable.isHidden)
        }
    }
    
    @IBAction func selectGradYearClick(_ sender: Any) {
        UIView.animate(withDuration: 0.3){
            self.yearsTable.isHidden = !(self.yearsTable.isHidden)
        }
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        // Validate Fields
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        else {
            // Create cleaned version of text fields
            
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passWordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let gradYear = selectGradYear.title(for: .normal)!.trimmingCharacters(in: .whitespacesAndNewlines)
            let college = selectCollege.title(for: .normal)!.trimmingCharacters(in: .whitespacesAndNewlines)
            // create user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    // There was an error creating the user
                    print(err)
                    self.showError("Error creating user")
                }
                else {
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    db.collection("users").document(email).setData(["firstName":firstName, "lastName":lastName, "uid":result!.user.uid, "gradYear": gradYear, "college": college]) { (error) in
                        
                        if error != nil {
                            self.showError("Error saving user data")
                        }
                    }
                    
                    self.transitionToHome() // transition to home screen
                }
            }
           
        }
    }
}

// for managing the drop down menus

extension SignUpViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        if self.collegesTable == tableView{
            return collegesList.count
        } else {
            return yearsList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.collegesTable == tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = collegesList[indexPath.row]
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "year", for: indexPath)
            cell.textLabel?.text = yearsList[indexPath.row]
            return cell
        }
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.collegesTable == tableView {
            selectCollege.setTitle("\(collegesList[indexPath.row])", for: .normal)
            UIView.animate(withDuration: 0.3){
                self.collegesTable.isHidden = !(self.collegesTable.isHidden)
            }
        } else {
            selectGradYear.setTitle("\(yearsList[indexPath.row])", for: .normal)
            UIView.animate(withDuration: 0.3){
                self.yearsTable.isHidden = !(self.yearsTable.isHidden)
            }
        }
    }
    
}

