////
////  NewsRequest.swift
////  ListDetails
////
////  Created by alexey sorochan on 12.02.2020.
////  Copyright © 2020 alexey sorochan. All rights reserved.
////
//
//import UIKit
//import Alamofire
//import AlamofireObjectMapper
//import RealmSwift
//
//class NewsRequest: UIViewController {
//    
//    public func newsRequestGlobal(link: String, parameters: [String: Any], isLoading: Bool) -> [NewsArticlesModel]{
//        
//        let realmService = RealmService.shared
//        var news: [NewsArticlesModel] = []
//        
//        debugPrint(parameters)
//        if !isLoading {
//            let url = URL(string: link)
//            if let recieveURL =  url {
//                debugPrint("recieveulr")
//                Alamofire.request(recieveURL,
//                                  method: .get,
//                                  parameters: parameters,
//                                  encoding: URLEncoding.default,
//                                  headers: ["X-Api-Key" : "439c5ba63c944a2cac581d87e18fc759"]).responseObject { (response: DataResponse<NewsModel>) in
//                           debugPrint(parameters, link, response)
//                                    if let recieveNews = response.result.value?.articles {
//                                        if recieveNews.count != 0 {
//                                
//                                            news.append(contentsOf: recieveNews)
//                                            realmService.writeNews(news)
//                                            debugPrint("req")
//                                            debugPrint(news.count)
//                                            
//                                            DispatchQueue.main.async {
//                                            debugPrint("news count in dispatch", news.count)
//                                            
//                                                self.transferToMainDataViewController()
//                                                
//                                                   
//                                            }
//                                            
//                                            
//                                           
//                                        } else {
//                                            debugPrint("no news recieve")
//                                        }
//                                    } else {
//                                        debugPrint("error or try load from memory")
//                                        debugPrint("error news load")
//                                    }
//                }
//            } else {
//                debugPrint("no url")
//            }
//        }
//        
//        return news
//    }
//}
//
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
