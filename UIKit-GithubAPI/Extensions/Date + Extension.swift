//
//  Date + Extension.swift
//  UIKit-GithubAPI
//
//  Created by Naela Fauzul Muna on 05/02/26.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
