//
//  HomeViewController.swift
//  Kz-Chat
//
//  Created by Matt Dolidze on 22.12.20.
//

import UIKit

// Should be able to go to ActiveUsers UserProfileViewController
// Should have a TableView of all friends
// Should be able to go to ChatViewController
// Should be able to search a KZUser, Go to his/her UserProfile and send a friendrequest
// Should have a BurgerMenu of incoming friend requests, where he/she can accept/decline the request


class HomeViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var activeUser: KZUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        navigationItem.hidesBackButton = true
        print(activeUser?.getUserName())
        if activeUser?.getUserName() == "" {
            
            // TODO: Notify user with a notification that he/she must assign a name to themselves
            
            let vc = UserProfileViewController.makeUserProfile(newUser: activeUser!)
            self.present(vc, animated: true, completion: nil)
        }
    }
    @IBAction func onMyProfilePressed(_ sender: Any) {
        OpenUserProfile()
    }
    
    func OpenUserProfile() {
        let vc = UserProfileViewController.makeUserProfile(newUser: activeUser!)
        self.present(vc, animated: true, completion: nil)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Search the database user collection with input
        // Update the tableview with given searches
    }
}
