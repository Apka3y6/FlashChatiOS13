

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var wrongInputTextField: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
//            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//              guard let strongSelf = self else { return }
//                self?.performSegue(withIdentifier: "RegisterToChat", sender: self)
//            }
            Auth.auth().createUser(withEmail: email, password: password) { AuthResult, error in
                if let e = error {
                    print("Register Controller Error.")
                    print(e.localizedDescription)
                    self.wrongInputTextField.text = e.localizedDescription
                } else {
                    //navigate to chat
                    self.performSegue(withIdentifier: /*"RegisterToChat"*/ K.registerSegue, sender: self)
                }
                
            }
        }
    }
    
}
