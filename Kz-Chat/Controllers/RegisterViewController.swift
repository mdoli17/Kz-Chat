//
//  RegisterViewController.swift
//  Kz-Chat
//
//  Created by Matt Dolidze on 22.12.20.
//

import UIKit
import FirebaseAuth
import Firebase
class RegisterViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repeatField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    let db = Firestore.firestore()
    var newUser: KZUser?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onSignPressed(_ sender: Any) {
        if let email = emailField.text, let password = passwordField.text, let repeated = repeatField.text, let username = usernameField.text {
            if repeated != password {
                // TODO: Make some kinda message for the user to know
                return
            }
            Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in
                if let error = error {
                    print(error)
                    // Make some kinda message for the user to know
                }
                else {
                    self.newUser = KZUser(name: username, email: email)
                    self.db.collection("Users").addDocument(data: ["username": self.newUser!.getUserName(), "useremail": email])
                    self.performSegue(withIdentifier: "RegisterToHome", sender: self)

                }
            })
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HomeViewController
        vc.activeUser = newUser
    }
}
