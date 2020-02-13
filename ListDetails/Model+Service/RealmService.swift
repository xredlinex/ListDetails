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
    
    func writeNews(_ news: [NewsArticlesModel]) {
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(news)
            }
        } catch {
            debugPrint("Error Write news")
        }
    }
    
    func getNews() -> [NewsArticlesModel] {
        
        do {
            let realm = try Realm()
            let news = realm.objects(NewsArticlesModel.self)
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
                realm.deleteAll()
            }
        } catch {
            debugPrint("error delete news from ream")
        }
    }
}


