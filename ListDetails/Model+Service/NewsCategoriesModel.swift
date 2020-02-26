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
        let technology = NewsCategories()
        technology.categoryName = "technology"
        technology.categoryImage = "technology"
        
        let sports = NewsCategories()
        sports.categoryName = "sports"
        sports.categoryImage = "sports"
        
        let business = NewsCategories()
        business.categoryName = "business"
        business.categoryImage = "business"
        
        let entertainment = NewsCategories()
        entertainment.categoryName = "entertainment"
        entertainment.categoryImage = "entertainment"
        
        let general = NewsCategories()
        general.categoryName = "general"
        general.categoryImage = "general"
        
        let health = NewsCategories()
        health.categoryName = "health"
        health.categoryImage = "health"
        
        let science = NewsCategories()
        science.categoryName = "science"
        science.categoryImage = "science"

        return [technology, sports, business, entertainment, general, health, science, ]
    }
}
