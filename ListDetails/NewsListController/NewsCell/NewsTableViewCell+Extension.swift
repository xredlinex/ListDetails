//
//  NewsTableViewCell+Extension.swift
//  ListDetails
//
//  Created by alexey sorochan on 14.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit


extension NewsTableViewCell {
    
    func converDate(_ date: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ssZ"
        let format = DateFormatter()
        format.dateFormat = "hh:mm a, d, MMMM, yyyy"
        if let date = dateFormatter.date(from: date) {
            return format.string(from: date)
        } else {
            return "-huhh-"
        }
    }
    
    func newNewsDate(_ date: String) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ssZ"
        let calendar = Calendar.current
        
        guard let dateNews = dateFormatter.date(from: date) else { return }
        
        if calendar.isDateInToday(dateNews) || calendar.isDateInYesterday(dateNews) {
            showFreshNewsHeightContstraint.priority = UILayoutPriority(rawValue: 900)
            freshNewsLabel.clipsToBounds = true
            freshNewsLabel.layer.cornerRadius = 6
        }
        
        }
    
}
