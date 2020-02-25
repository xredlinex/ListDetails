////
////  realm.swift
////  ListDetails
////
////  Created by alexey sorochan on 24.02.2020.
////  Copyright © 2020 alexey sorochan. All rights reserved.
////
//
//import Foundation
////
////  RealmModel.swift
////  ListDetails
////
////  Created by alexey sorochan on 11.02.2020.
////  Copyright © 2020 alexey sorochan. All rights reserved.
////
//
//import Foundation
//import UIKit
//import ObjectMapper
//import RealmSwift
//
//class NewsModeRealm: Object, Mappable {
//    dynamic var status: String?
//    dynamic var totalResults: Int?
//    dynamic var articles = [NewsArticlesModel]()
//    
//    func mapping(map: Map) {
//          status        <- map["status"]
//          totalResults  <- map["totalResults"]
//          articles      <- map["articles"]
//      }
//    
//    required convenience init?(map: Map) {
//        self.init()
//    }
//    
//    required init() {
//        super.init()
//    }
//}
//
//class NewsArticlesModelRealm: Object, Mappable {
//    
//    @objc dynamic var sourse: NewsArticlesSourseModelRealm?
//    @objc dynamic var author: String?
//    @objc dynamic var title: String?
//    @objc dynamic var newsDescription: String?
//    @objc dynamic var url: String?
//    @objc dynamic var urlToImage: String?
//    @objc dynamic var publishedAt: String?
//    @objc dynamic var content: String?
//    
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
//}
//
//class NewsArticlesSourseModelRealm: Object, Mappable {
//    
//    @objc dynamic var id: String?
//    @objc dynamic var name: String?
//    
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
//}
//
