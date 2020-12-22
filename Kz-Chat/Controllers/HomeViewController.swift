//
//  HomeViewController.swift
//  Kz-Chat
//
//  Created by Matt Dolidze on 22.12.20.
//

import UIKit

class HomeViewController: UIViewController {
    
    var activeUser: KZUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        if activeUser?.getUserName() == "" {
            
            // TODO: Notify user with a notification that he/she must assign a name to themselves
            
            let vc = UserProfileViewController()
            self.present(vc, animated: true, completion: nil)
        }
        
    }

}
