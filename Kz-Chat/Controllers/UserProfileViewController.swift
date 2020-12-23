//
//  UserProfileViewController.swift
//  Kz-Chat
//
//  Created by Matt Dolidze on 22.12.20.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    var viewedUser: KZUser!
    
    static func makeUserProfile(newUser: KZUser) -> UserProfileViewController {
        let newVC = UserProfileViewController(nibName: "UserProfileViewController", bundle: nil)
        newVC.viewedUser = newUser
        return newVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.text = viewedUser?.getUserName()
        emailField.text = viewedUser?.getUserEmail()
        emailField.isUserInteractionEnabled = false
        
    }
    
    @IBAction func onUsernameChanged(_ sender: Any) {
        
    }
    
}
