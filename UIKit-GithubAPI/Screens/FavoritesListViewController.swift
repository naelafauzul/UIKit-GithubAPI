//
//  FavoritesListViewController.swift
//  UIKit-GithubAPI
//
//  Created by Naela Fauzul Muna on 27/01/26.
//

import UIKit

class FavoritesListViewController: UIViewController {
    
    let tableView = UITableView()
    var favorites: [Follower] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favorites"
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseID)
    }
    
    func getFavorites() {
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let favorites):
                if favorites.isEmpty {
                    showEmptyView(message: "No Favorites?\nAdd one on the follower screen.", in: self.view)
                } else {
                    self.favorites = favorites
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
}

extension FavoritesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.reuseID) as! FavoriteCell
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favorite = favorites[indexPath.row]
        let descVC = FollowersListViewController()
        descVC.username = favorite.login
        descVC.title = favorite.login
        
        navigationController?.pushViewController(descVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let favorite = favorites[indexPath.row]
        favorites.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        
        PersistenceManager.updateWith(favorite: favorite, actionType: .remove) { [weak self] error in
            guard let self = self else { return }
            guard let error = error else { return }
            self.presentGFAlertOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "OK")
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
