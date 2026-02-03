//
//  UserInfoViewController.swift
//  UIKit-GithubAPI
//
//  Created by Naela Fauzul Muna on 03/02/26.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = doneButton
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                self?.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }
    
    
}
