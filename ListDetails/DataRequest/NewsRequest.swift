//
//  NewsRequest.swift
//  ListDetails
//
//  Created by alexey sorochan on 12.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import RealmSwift

//class NewsRequest: UIViewController {
//    
//    func globalNewsRequest(isLoaded: Bool,link: String, keyword: String? = nil, country: String? = nil, category: String? = nil, pageNumber: Int) {
//        
//        var news: [NewsArticlesModel] = []
//        let realmService = RealmService.shared
//        
//        let parameters: [String : Any] = ["q" : keyword ?? "",
//                                          "country" : country ?? "",
//                                          "category" : category ?? "",
//                                          "page" : pageNumber]
//        
//        if !isLoaded {
//            let url = URL(string: link)
//            if let recieveURL = url {
//                Alamofire.request(recieveURL,
//                                  method: .get,
//                                  parameters: parameters,
//                                  encoding: URLEncoding.default,
//                                  headers: ["X-Api-Key" : "439c5ba63c944a2cac581d87e18fc759"]).responseObject { (response: DataResponse<NewsModel>) in
//                                    if let recieveNews = response.result.value?.articles {
//                                        if recieveNews.count != 0 {
//                                            news.append(contentsOf: recieveNews)
//                                            realmService.writeNews(news)
//                                            
//                                        } else {
//                                            debugPrint("no news found")
//                                        }
//                                    } else {
//                                        debugPrint("bad resonse")
//                                    }
//                }
//            } else {
//               debugPrint("no  link")
//            }
//        }
//        
//        
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//}
////
//
//extension UIApplication {
//    var keyWindow: UIWindow? {
//        return windows.first(where: { $0.isKeyWindow })
//    }
//}
//
//extension UIViewController {
//    
//   
//}
//
//extension UIViewController {
//    
//    func transferToMainDataViewController() {
//        
//        let myKeyWindow: UIWindow? = UIApplication.shared.keyWindow
//        let navigationController = UINavigationController(rootViewController: self)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsListViewController") as! NewsListViewController
//        navigationController.isToolbarHidden = true
//        myKeyWindow?.rootViewController = navigationController
//        navigationController.pushViewController(viewController, animated: false)
//        
//    }
//}
