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
    
//    func newsRequest(link: String, keyword: String? = nil, country: String? = nil, category: String? = nil, pageNumber: Int) {
        
    func newsRequest() {

        if !isLoadedNews {
            let parameters = ["country" : country,
                              "page" : pageNumber,
                              "category" : category ?? "",
                              "pageSize": pageSize] as [String:Any]
                  debugPrint(parameters)
            let url = URL(string: link)
            if let urlCorrect = url {
                Alamofire.request(urlCorrect,
                                  method: .get,
                                  parameters: parameters,
                                  encoding: URLEncoding.default,
                                  headers: ["X-Api-Key" : apikey]).responseObject { (response: DataResponse<NewsModel>) in
                                    debugPrint(response)
                                    if let recieveNews = response.result.value?.articles {
                                        if recieveNews.count != 0 {
                                            debugPrint(recieveNews.count)
                                            self.news.append(contentsOf: recieveNews)
//                                            add realm
                                            DispatchQueue.main.async {
                                                self.tableView.reloadData()
                                            }
                                        } else {
                                            debugPrint("no recieve news")
                                        }
                               
                                        
                                    } else {
                                        debugPrint("no result")
                                    }
                }
                
            } else {
                debugPrint("no url")
            }
            
            
    
        }
    }
    
}


