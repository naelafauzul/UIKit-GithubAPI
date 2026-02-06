//
//  GFFollowerItemViewController.swift
//  UIKit-GithubAPI
//
//  Created by Naela Fauzul Muna on 05/02/26.
//

import UIKit

class GFFollowerItemViewController: GFItemInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Github Followers")
    }
    
    override func actionButtonTapped() {
        delegate?.didTapGetFollowers(for: user)
    }
    
}
