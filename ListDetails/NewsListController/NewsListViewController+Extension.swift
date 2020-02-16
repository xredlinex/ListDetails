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
        debugPrint("new request go")
        if !isLoadedNews {
            var parameters: [String : Any] = [:]
            if !isSearchNews {
                debugPrint(isSearchNews, "--------------------no search")
                
                 parameters = ["country" : country,
                                "page" : pageNumber,
                                "q" : keyword ?? "",
                                "category" : category ?? "",
                                "pageSize": pageSize]
            } else {
                debugPrint(isSearchNews, "-------------------- search")
                
                parameters = ["q" : keyword ?? "",
                              "pageSize" : pageSize,
                              "page" : pageNumber]
            }
            
            
            
                  debugPrint("--------------------------", parameters)
            if let linkCorrect = link {
                debugPrint(linkCorrect)
                let url = URL(string: linkCorrect)
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
                                                self.realmService.writeNews(self.news)
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
            } else {
                debugPrint("fatal error")
            }
            
            
            
    
        }
    }
    
}


extension NewsListViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
}

extension NewsListViewController {
    
    func searchNews() {
        
        if let searchKeyword = searchTextField.text, keyword != "" {
            
            keyword = searchKeyword
            
            newsRequest()
            
            
        }
        
        
        
        
    }
    
}

