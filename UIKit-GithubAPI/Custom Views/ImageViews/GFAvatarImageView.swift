//
//  GFAvatarImageView.swift
//  UIKit-GithubAPI
//
//  Created by Naela Fauzul Muna on 31/01/26.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    let placeholderImage = Images.placeholderImage
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        image = placeholderImage
        contentMode = .scaleAspectFill
        
    }
    
    //Non escaping func karena completion langusng dipanggil dan parse ke image view
//    func downloadImage(from urlString: String, completion: (() -> Void)? = nil) {
//        let cacheKey = NSString(string: urlString)
//        
//        if let image = cache.object(forKey: cacheKey) {
//            self.image = image
//            return
//        }
//    
//        guard let url = URL(string: urlString) else { return }
//        
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//            defer { DispatchQueue.main.async {
//                completion?()
//            } }
//            
//            guard let self = self else { return }
//            if error != nil { return }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
//            guard let data = data else { return }
//            
//            guard let image = UIImage(data: data) else { return }
//            self.cache.setObject(image, forKey: cacheKey)
//            
//            DispatchQueue.main.async {
//                self.image = image
//            }
//        }
//        
//        task.resume()
//    }
}
