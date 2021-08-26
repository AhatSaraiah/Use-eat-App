
import UIKit
import Firebase
import FirebaseAuth
class LoginViewController: UIViewController {
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
       

    
    @IBAction func loginTapped(_ sender: UIButton!) {
                    
            // Create cleaned versions of the text field
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if error != nil {
                    // Couldn't sign in
                    print("nil")
                }
                else {
                    print("login successfuly")
                    self.transitionToHome();
                }
            }
    
  }
    func transitionToHome() {
        let newViewController = TableViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)

    }
    
    
}
