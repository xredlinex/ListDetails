//
//  NewsCategoriesModel.swift
//  ListDetails
//
//  Created by alexey sorochan on 14.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation

class NewsCategories {
    
    var categoryName: String?
    var categoryImage: String?
}

class NewsCategoriesList {
    
    func getCategories() -> [NewsCategories] {
        let one = NewsCategories()
        one.categoryName = "business"
        one.categoryImage = "business"
        
        let two = NewsCategories()
        two.categoryName = "entertainment"
        two.categoryImage = "entertainment"
        
        let three = NewsCategories()
        three.categoryName = "general"
        three.categoryImage = "general"
        
        let four = NewsCategories()
        four.categoryName = "health"
        four.categoryImage = "health"
        
        let five = NewsCategories()
        five.categoryName = "science"
        five.categoryImage = "science"
        
        let six = NewsCategories()
        six.categoryName = "sports"
        six.categoryImage = "sports"
        
        let seven = NewsCategories()
        seven.categoryName = "technology"
        seven.categoryImage = "technology"
        
        return [one, two, three, four, five, six, seven]
    }
}
