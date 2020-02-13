//
//  NewsListViewController.swift
//  ListDetails
//
//  Created by alexey sorochan on 11.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire
import AlamofireObjectMapper
import Network


class NewsListViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    
    let realmService = RealmService.shared
    var news: [NewsArticlesModel] = []
    var pageNumber = 1
    var pageSize = 10
    var maxCount = 100
    var isLoadedNews = true
    var parameters: [String : Any] = [:]
    var link = "https://newsapi.org/v2/top-headlines"
    var country = "ua"
    var ifConnect = false
    
    var refreshControll = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        realmService.deleteNews()
        networkConnect()
        debugPrint(country)
        
        if !ifConnect {
            if news.isEmpty {
                isLoadedNews = false
                debugPrint("new request")
                newsRequest(link: link, country: country)
            }
        } else {
            if realmService.getNews().isEmpty {
                debugPrint("sorry no news in cache")
            } else {
                news = realmService.getNews()
            }
        }
        refreshControll.attributedTitle = NSAttributedString(string: "updating news")
        refreshControll.addTarget(self, action: #selector(refreshData), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControll)
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func didTapSelectCountryActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Country", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CountrySortViewController") as! CountrySortViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension NewsListViewController {
    
    @objc func refreshData() {
       
        pageNumber = 1
        news.removeAll()
        tableView.reloadData()
//        realmService.deleteNews()
        newsRequest(link: link, country: country)
        refreshControll.endRefreshing()
//        add toast update complere
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
