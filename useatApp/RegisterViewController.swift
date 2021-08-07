//
//  RegisterViewController.swift
//  useatApp
//
//  Created by user196211 on 7/8/21.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift
class RegisterViewController: UIViewController {

    
    @IBOutlet weak var aboutMeTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
    //    backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
       // var ref: DatabaseReference!
       /// ref = Database.database().reference()
       // ref.child("users").child("ah").setValue(["username": "Ahat Saraiah"])
        // Do any additional setup after loading the view.
        //Looks for single or multiple taps.
          let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

         //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
         //tap.cancelsTouchesInView = false

         view.addGestureRecognizer(tap)
     }

     //Calls this function when the tap is recognized.
     @objc func dismissKeyboard() {
         //Causes the view (or one of its embedded text fields) to resign the first responder status.
         view.endEditing(true)
     }

    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
//    func validateFields() -> String? {
//
//        // Check that all fields are filled in
//        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            aboutMeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
//
//            return "Please fill in all fields."
//        }
//
//        // Check if the password is secure
//        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//        if Utilities.isPasswordValid(cleanedPassword) == false {
//            // Password isn't secure enough
//            return "Please make sure your password is at least 8 characters, contains a special character and a number."
//        }
//
//        return nil
//      }
//

    
    @IBAction func signUpTapped(_ sender: Any) {
        
        // Validate the fields
         //     let error = validateFields()
              
         //     if error != nil {
                  
                  // There's something wrong with the fields, show error message
         //         showError(error!)
        //      }
        //      else {
                  
                  // Create cleaned versions of the data
                  let name = nameTextField.text!
                  let aboutMe = aboutMeTextField.text!
                  let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                  let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                  
                  // Create the user
                  Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                      
                      // Check for errors
                //      if err != nil {
                          
                          // There was an error creating the user
                      //    self.showError("Error creating user")
                 //     }
                 //     else {
                          
                          // User was created successfully, now store the name
                          let db = Firestore.firestore()
                          
                        db.collection("users").addDocument(data: ["name":name,"aboutMe": aboutMe
                                                                  ,"uid": result!.user.uid ]) { (error) in
                              
                       //       if error != nil {
                                  // Show error message
                      //            self.showError("Error saving user data")
                             // }
                        //  }
                          
                          //Transition to the home screen
                          self.transitionToHome()
                      }
                                        
             }
                                       
         }
 //  }
          func showError(_ message:String) {
              
              errorLabel.text = message
              errorLabel.alpha = 1
           }
    
    func transitionToHome() {

        let newViewController = HomeViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}


