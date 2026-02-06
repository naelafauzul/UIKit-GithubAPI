//
//  GFItemInfoViewController.swift
//  UIKit-GithubAPI
//
//  Created by Naela Fauzul Muna on 05/02/26.
//

import UIKit

class GFItemInfoViewController: UIViewController {
    
    let stackView = UIStackView()
    let itemInfoViewOne = GFItemInfoView()
    let itemInfoViewTwo = GFItemInfoView()
    let actionButton = GFButton()
    
    var user: User!
    weak var delegate: UserInfoViewControllerDelegate?
    
    init(user: User!) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        configuteBackgroundView()
        configureStackView()
        configureActionButton()
    }
    
    func configuteBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
    }
    
    private func configureActionButton() {
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc func actionButtonTapped() {
        print("✅ tapped in base:", type(of: self))
    }
    
    private func layoutUI() {
        view.addSubview(stackView)
        view.addSubview(actionButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.layer.cornerRadius = 8
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}

#if DEBUG
import SwiftUI

struct GFItemInfoViewController_Previews: PreviewProvider {
    static var previews: some View {
        GFItemInfoVCWrapper()
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.light)
    }
}

struct GFItemInfoVCWrapper: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> GFItemInfoViewController {
        let mockUser = User(
            login: "naelafauzul",
            avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4",
            name: "Naela Fauzul Muna",
            location: "Indonesia",
            bio: "iOS Developer • UIKit & SwiftUI",
            publicRepos: 42,
            publicGists: 10,
            htmlUrl: "https://github.com/naelafauzul",
            following: 80,
            followers: 120,
            createdAt: "2020-01-01T00:00:00Z"
        )
        
        let vc = GFItemInfoViewController(user: mockUser)
        vc.view.frame = CGRect(x: 0, y: 0, width: 350, height: 120)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: GFItemInfoViewController, context: Context) {}
}
#endif
