//
//  NewsListViewController+Request.swift
//  ListDetails
//
//  Created by alexey sorochan on 17.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit
import AlamofireObjectMapper
import Alamofire
import RealmSwift
import Network


extension NewsListViewController {
            
    func newsRequest() {
        
        view.makeToastActivity(.center)
        if !isLoadedNews {
            var parameters: [String : Any] = [:]
            if !isSearchNews {
                 parameters = ["country" : country,
                                "page" : pageNumber,
                                "q" : keyword ?? "",
                                "category" : category ?? "",
                                "pageSize": pageSize]
            } else {
                parameters = ["q" : keyword ?? "",
                              "pageSize" : pageSize,
                              "page" : pageNumber]
            }
            
            if let linkCorrect = link {
                let url = URL(string: linkCorrect)
                if let urlCorrect = url {
                    Alamofire.request(urlCorrect,
                                      method: .get,
                                      parameters: parameters,
                                      encoding: URLEncoding.default,
                                      headers: ["X-Api-Key" : apikey]).responseObject { (response: DataResponse<NewsModel>) in
                                        if let recieveNews = response.result.value?.articles {
                                            if recieveNews.count != 0 {
                                                self.news.append(contentsOf: recieveNews)
                                                self.realmService.writeNews(self.news)
                                                DispatchQueue.main.async {
                                                    self.tableView.reloadData()
                                                    self.view.hideAllToasts()
                                                    self.view.hideToastActivity()
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
            } else {
                debugPrint("fatal error")
            }
        }
    }
    
}


extension NewsListViewController {
    
    func networkConnect() {
        
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.ifConnect = true
            }
        }
    }
}
