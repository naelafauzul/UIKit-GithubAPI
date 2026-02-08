//
//  UIView + Extension.swift
//  UIKit-GithubAPI
//
//  Created by Naela Fauzul Muna on 08/02/26.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
