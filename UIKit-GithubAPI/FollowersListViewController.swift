//
//  FollowersViewController.swift
//  UIKit-GithubAPI
//
//  Created by Naela Fauzul Muna on 27/01/26.
//

import UIKit

class FollowersListViewController: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
