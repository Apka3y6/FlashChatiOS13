

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var loginErrorDiscription: UILabel!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { /*[weak self]*/ authResult, error in
                /*guard let strongSelf = self else { return }*/
                if let e = error {
                    print(e.localizedDescription)
                    self.loginErrorDiscription.text = e.localizedDescription
                } else {
                    self.performSegue(withIdentifier: /*"LoginToChat"*/ K.loginSegue, sender: self)
                }
            }
        }
    }
    
}
