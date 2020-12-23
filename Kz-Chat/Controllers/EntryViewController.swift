//
//  ViewController.swift
//  Kz-Chat
//
//  Created by Matt Dolidze on 22.12.20.
//

import UIKit
import FirebaseAuth
import Firebase

class EntryViewController: UIViewController {
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var createUser: UIButton!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userEmail.placeholder = "Email"
        userPassword.placeholder = "Password"
        
    }
    

    @IBAction func onCreatePressed(_ sender: Any) {
        self.performSegue(withIdentifier: "EntryToRegister", sender: self)
    }
    
    @IBAction func onLoginPressed(_ sender: Any) {
        if let email = userEmail.text, let password = userPassword.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: {result, error in
                if let e = error {
                    print(e)
                    // TODO: Notify the user that they couldn't log in
                } else {
                    self.performSegue(withIdentifier: "EntryToHome", sender: self)
                }
            })
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EntryToHome" {
            let curUserEmail = Auth.auth().currentUser?.email
            let vc = segue.destination as! HomeViewController
            
            db.collection("Users").getDocuments() {querySnapshot, error in
                if let error = error {
                    print("Could't Fetch Data")
                    print(error)
                } else {
                    for doc in querySnapshot!.documents {
                        let curData = doc.data()
                        let logedEmail = curData["useremail"] as! String
                        if logedEmail == curUserEmail {
                            let logedName = curData["username"] as! String
                            let logedUser = KZUser(name: logedName, email: logedEmail)
                            vc.activeUser = logedUser
                        }
                    }
                }
            }
        }
    }
}

