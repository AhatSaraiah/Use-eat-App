//
//  ViewController.swift
//  useatApp
//
//  Created by user196211 on 6/23/21.
//

import UIKit
import Firebase
import FirebaseAuth
class ViewController: UIViewController {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var assosiationSignUpbutton: UIButton!
    @IBOutlet weak var resturantSignUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
       
//
//    @objc func didTapLoginButton() {
//        let loginManager = FirebaseAuthManager()
//        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
//        loginManager.signIn(email: email, pass: password) {[weak self] (success) in
//            guard let `self` = self else { return }
//            var message: String = ""
//            if (success) {
//                message = "User was sucessfully logged in."
//            } else {
//                message = "There was an error."
//            }
//            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//            self.display(alertController: alertController)
//        }
//    }
//
//    func display(alertController: UIAlertController) {
//        self.present(alertController, animated: true, completion: nil)
//    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
        // TODO: Validate Text Fields
            
            // Create cleaned versions of the text field
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if error != nil {
                    // Couldn't sign in
                 //   self.errorLabel.text = error!.localizedDescription
                   // self.errorLabel.alpha = 1
                    print("nil")
                }
                else {
                    print("login successfuly")
                    self.transitionToHome();
                }
            }
    
  }
    func transitionToHome() {
        let newViewController = HomeViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
