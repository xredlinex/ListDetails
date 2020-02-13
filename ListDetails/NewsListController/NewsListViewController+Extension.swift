//
//  NewsListViewController+Extension.swift
//  ListDetails
//
//  Created by alexey sorochan on 11.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import RealmSwift


extension NewsListViewController {
    
    func newsRequest(link: String, keyword: String? = nil, country: String? = nil, category: String? = nil) {
        
        parameters = ["q" : keyword ?? "",
                      "country" : country ?? "",
                      "category" : category ?? "",
                      "page" : pageNumber]
        
        if !isLoadedNews {
            let url = URL(string: link)
            if let recieveURL = url {
                Alamofire.request(recieveURL,
                                  method: .get,
                                  parameters: parameters,
                                  encoding: URLEncoding.default,
//                    439c5ba63c944a2cac581d87e18fc759
                                  headers: ["X-Api-Key" : "e796d4f208d34b95855430b1f8f2fa42"]).responseObject { (responce: DataResponse<NewsModel>) in
                                    if let recieveNews = responce.result.value?.articles {
                                        if recieveNews.count != 0 {
                                            self.news.append(contentsOf: recieveNews)
                                            self.realmService.writeNews(self.news)
                                        } else {
//                                            no news found
                                            debugPrint("no news")
                                        }
                                        self.tableView.reloadData()
                                    } else {
                                        debugPrint("no result")
//                                        alert no result
                                    }
                }
            } else {
//                alert no link
                debugPrint("no link")
            }
        }
    }
    
}

