//
//  FavoriteCell.swift
//  UIKit-GithubAPI
//
//  Created by Naela Fauzul Muna on 07/02/26.
//

import UIKit
import Foundation

class FavoriteCell: UITableViewCell {
    static let reuseID: String = "FavoriteCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 16)
    
    private let spinner = UIActivityIndicatorView(style: .medium)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        spinner.startAnimating()
    }
    
    func set(favorite: Follower) {
        usernameLabel.text = favorite.login
        avatarImageView.downloadImage(from: favorite.avatarUrl) { [weak self] in
            self?.spinner.stopAnimating()
        }
    }
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
                usernameLabel.translatesAutoresizingMaskIntoConstraints = false
                spinner.translatesAutoresizingMaskIntoConstraints = false
        
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
