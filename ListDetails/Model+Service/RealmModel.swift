//
//  RealmModel.swift
//  ListDetails
//
//  Created by alexey sorochan on 11.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

//class NewsModelRealm: Object {
//    dynamic var status: String?
//    dynamic var totalResults: Int?
//    dynamic var articles = [NewsArticlesModelRealm]()
    
//    func mapping(map: Map) {
//          status        <- map["status"]
//          totalResults  <- map["totalResults"]
//          articles      <- map["articles"]
//      }
    
//    required convenience init?(map: Map) {
//        self.init()
//    }
//
//    required init() {
//        super.init()
//    }
    
    
//    func convertToRealmModel(from: NewsModel) -> NewsModelRealm {
//
//        let news = NewsModelRealm()
//
//
//        return news
//    }
    
    
//}

class NewsArticlesModelRealm: Object {
    
    @objc dynamic var sourse: NewsArticlesSourseModelRealm?
    @objc dynamic var author: String?
    @objc dynamic var title: String?
    @objc dynamic var newsDescription: String?
    @objc dynamic var url: String?
    @objc dynamic var urlToImage: String?
    @objc dynamic var publishedAt: String?
    @objc dynamic var content: String?
    
    
//    func convertToRealmModel(from: NewsArticlesModel) -> NewsArticlesModelRealm {
//        let news = NewsArticlesModelRealm()
//
//        if let author = from.author {
//            news.author = author
//        }
//        if let title = from.title {
//            news.title = title
//        }
//        if let description = from.description {
//            news.newsDescription = description
//        }
//        if let url = from.url {
//            news.url = url
//        }
//        if let
//
//
//        return news
//    }
    
    
    
    
//    func mapping(map: Map) {
//        sourse              <- map["sourse"]
//        author              <- map["author"]
//        title               <- map["title"]
//        newsDescription     <- map["description"]
//        url                 <- map["url"]
//        urlToImage          <- map["urlToImage"]
//        publishedAt         <- map["publishedAt"]
//        content             <- map["content"]
//    }
//
//    required convenience init?(map: Map) {
//        self.init()
//    }
//
//    required init() {
//        super.init()
//    }
}

class NewsArticlesSourseModelRealm: Object {
    
    @objc dynamic var id: String?
    @objc dynamic var name: String?
    
//    func mapping(map: Map) {
//         id      <- map["id"]
//         name    <- map["name"]
//     }
//
//    required convenience init?(map: Map) {
//        self.init()
//    }
//
//    required init() {
//        super.init()
//    }
}

