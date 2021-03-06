//
//  NewsModel.swift
//  ListDetails
//
//  Created by alexey sorochan on 24.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

class NewsModel: Codable {
    
    var status: String?
    var totalResults: Int?
    var articles: [NewsArticlesModel]?
    
    enum CodingKeys: String, CodingKey {
        case status, totalResults, articles
    }
}

class NewsArticlesModel: Codable {
    
    var source: NewsArticlesSourceModel?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
}

class NewsArticlesSourceModel: Codable {
    
    var id: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}
