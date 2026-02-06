//
//  FavoritesListViewController.swift
//  UIKit-GithubAPI
//
//  Created by Naela Fauzul Muna on 27/01/26.
//

import UIKit

class FavoritesListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        PersistenceManager.retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }
}


//MARK: - Preview
import SwiftUI

struct FavoritesListViewControllerPreview: UIViewControllerRepresentable {
    typealias UIViewControllerType = FavoritesListViewController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        .init()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

#Preview {
    FavoritesListViewControllerPreview()
}
