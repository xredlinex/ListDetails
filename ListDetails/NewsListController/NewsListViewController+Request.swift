//
//  NewsListViewController+Request.swift
//  ListDetails
//
//  Created by alexey sorochan on 17.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import RealmSwift
import Network
import Toast_Swift

//  MARK: - REQUEST -
extension NewsListViewController {
    
    func newsRequest() {
        
        view.makeToastActivity(.center)
        if !isLoadedNews {
            if let linkCorrect = link {
                let url = URL(string: linkCorrect)
                if let urlCorrect = url {
                    Alamofire.request(urlCorrect,
                                      method: .get,
                                      parameters: parameters,
                                      encoding: URLEncoding.default,
                                      headers: ["X-Api-Key" : apikey]).responseData { (response) in
                                        if let data = response.result.value {
                                            do {
                                                let newsModel = try JSONDecoder().decode(NewsModel.self, from: data)
                                                if let articles = newsModel.articles {
                                                    if articles.count != 0 {
                                                        self.news.append(contentsOf: articles)
                                                        self.writeNewsRealm()
                                                        self.tableView.reloadData()
                                                        self.view.hideToastActivity()
                                                    } else {
                                                        if self.news.count == 0 {
                                                            self.presentErrorAlert(title: "Sorry", self.errorAlert.errorKey(.noNews))
                                                            self.view.hideToastActivity()
                                                        } else {
                                                            self.view.makeToast(self.errorAlert.errorKey(.noMoreNews), duration: 3.0, position: .center)
                                                            self.view.hideToastActivity()
                                                        }
                                                    }
                                                } else {
                                                    self.presentErrorAlert(title: "Sorry", self.errorAlert.errorKey(.noReq))
                                                    self.view.hideToastActivity()
                                                }
                                            } catch  {
                                                debugPrint("error")
                                            }
                                        } else {
                                            self.presentErrorAlert(title: "Error", self.errorAlert.errorKey(.badRequest))
                                            self.view.hideToastActivity()
                                        }
                    }
                }  else {
                    self.presentErrorAlert(title: "Error", errorAlert.errorKey(.noLink))
                    self.view.hideToastActivity()
                }
            } else {
                self.presentErrorAlert(title: "Error", errorAlert.errorKey(.noLink))
                self.view.hideToastActivity()
            }
        }
    }
}

//  MARK: - NETWORK MONITOR -
extension NewsListViewController {
    
    func networkConnectRequesrt() {
        
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isLoadedNews = false
                self.newsRequest()
            } else {
                debugPrint("try load news from memory")
                self.view.makeToast(self.errorAlert.errorKey(.noInternet), duration: 5.0, position: .top)
                self.getNewsRealm()
                self.tableView.reloadData()
            }
        }
        monitor.start(queue: DispatchQueue.main)
    }
}

//  MARK: - WRITE NEWS TO REALM -
extension NewsListViewController {
    
    func writeNewsRealm() {
        
        let realmNews = convertToRealmModel(fromArticlesModel: news)
        self.realmService.deleteNews()
        self.realmService.writeNews(realmNews)
    }
    
    func getNewsRealm() {
        
        let realmNews = self.realmService.getNews()
        news = convertToNewsModel(fromRealmArticles: realmNews)
    }
}

//  MARK: - CONVERT NEWS MODEL TO REALM MODEL AND BACK -
extension NewsListViewController {
    
    func convertToRealmModel(fromArticlesModel: [NewsArticlesModel]) -> [NewsArticlesModelRealm] {
        
        var realmNews: [NewsArticlesModelRealm] = []
        
        for news in fromArticlesModel {
            
            let newsModelRealm = NewsArticlesModelRealm()
            let newsSourseRealm = NewsArticlesSourseModelRealm()
            
            if let author = news.author {
                newsModelRealm.author = author
            }
            if let title = news.title {
                newsModelRealm.title = title
            }
            if let description = news.description {
                newsModelRealm.newsDescription = description
            }
            if let url = news.url {
                newsModelRealm.url = url
            }
            if let urlToImage = news.urlToImage {
                newsModelRealm.urlToImage = urlToImage
            }
            if let publishAt = news.publishedAt {
                newsModelRealm.publishedAt = publishAt
            }
            if let content = news.content {
                newsModelRealm.content = content
            }
            if let sourse = news.source {
                if let name = sourse.name {
                    newsSourseRealm.name = name
                }
                if let id = sourse.id {
                    newsSourseRealm.id = id
                }
            }
            newsModelRealm.sourse = newsSourseRealm
            realmNews.append(newsModelRealm)
        }
        return realmNews
    }
    
    func convertToNewsModel(fromRealmArticles: [NewsArticlesModelRealm]) -> [NewsArticlesModel]  {
        
        var news: [NewsArticlesModel] = []
        
        for realmNews in fromRealmArticles {
            
            let newsArticlesModel = NewsArticlesModel()
            let newsArticlesSourceModel = NewsArticlesSourceModel()
            
            newsArticlesModel.author = realmNews.author
            newsArticlesModel.title = realmNews.title
            newsArticlesModel.description = realmNews.newsDescription
            newsArticlesModel.url = realmNews.url
            newsArticlesModel.urlToImage = realmNews.urlToImage
            newsArticlesModel.publishedAt = realmNews.publishedAt
            newsArticlesModel.content = realmNews.content
            
            if let sourse = realmNews.sourse {
                newsArticlesSourceModel.id = sourse.id
                newsArticlesSourceModel.name = sourse.name
            }
            newsArticlesModel.source = newsArticlesSourceModel
            news.append(newsArticlesModel)
        }
        return news
    }
}
