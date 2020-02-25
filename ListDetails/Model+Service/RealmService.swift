//
//  RealmService.swift
//  ListDetails
//
//  Created by alexey sorochan on 11.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {
    
    static let shared: RealmService = {
        
        let instance = RealmService()
        return instance
    }()
    
    func writeNews(_ news: [NewsArticlesModelRealm]) {
        do {
            let realm = try Realm()
            let news2 = news
            news2.forEach { (article) in
                do {
                    try realm.write {
                        realm.add(article)
                    }
                } catch {                }
            }
        } catch {
            debugPrint("Error Write news")
        }
    }
    
    func getNews() -> [NewsArticlesModelRealm] {
        
        do {
            let realm = try Realm()
            let news = realm.objects(NewsArticlesModelRealm.self)
            let newsList = Array(news)
            return newsList
        } catch {
            debugPrint("error get news from realm")
        }
        return []
    }
    
    func deleteNews() {
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(getNews())
            }
        } catch {
            debugPrint("error delete news from ream")
        }
    }
}


