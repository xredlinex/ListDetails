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


    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainNewsImageView: UIImageView!
    @IBOutlet weak var categoriesNewsImageView: UIImageView!
    @IBOutlet weak var searchNewsImageView: UIImageView!
    
    
    let realmService = RealmService.shared
    var news: [NewsArticlesModel] = []
    var newsCategories: [NewsCategories] = []
    
    var keyword: String?
    var category: String?
    var pageNumber: Int = 1
    var pageSize: Int = 10
    var maxCount: Int = 100
    var isLoadedNews = true
    let apikey = "df23a739ff1045119ffd367b733c0c58"
    var link = "https://newsapi.org/v2/top-headlines"
    var country = "us"

    var ifConnect = false
    
    var refreshControll = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        newsCategories = NewsCategoriesList().getCategories()
        mainNewsImageView.tintColor = .red
        
        realmService.deleteNews()
        networkConnect()
        

        
        if !ifConnect {
            if news.isEmpty {
                isLoadedNews = false
                debugPrint("new request try")
                newsRequest()
            }
        } else {
            if realmService.getNews().isEmpty {
                debugPrint("sorry no news in cache")
            } else {
                debugPrint("no inete whaat")
                news = realmService.getNews()
            }
        }
        
        
        
        
        refreshControll.attributedTitle = NSAttributedString(string: "updating news")
        refreshControll.addTarget(self, action: #selector(refreshData), for: UIControl.Event.valueChanged)
        
        
        collectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    
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
    @IBAction func didTapMainNewsActionButton(_ sender: Any) {
        debugPrint(country, "first")
        country = "us"
        debugPrint(country, "not first")
        debugPrint(category)
        category = nil
        debugPrint(category)
        
        showCollectionViewHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        mainNewsImageView.tintColor = .red
        searchNewsImageView.tintColor = .white
        categoriesNewsImageView.tintColor = .white
//
        
        
        pageNumber = 1
        isLoadedNews = false
        news.removeAll()
        tableView.reloadData()
//        tableView.reloadData()
        newsRequest()
////        tableView.reloadData()
//
        
        
    }
    
    
    @IBAction func didTapSowSearchActionButton(_ sender: Any) {
        searchNewsImageView.tintColor = .red
        mainNewsImageView.tintColor = .white
        categoriesNewsImageView.tintColor = .white
        
        showCollectionViewHeightConstraint.priority = UILayoutPriority(rawValue: 600)
    }
    
    
    @IBAction func didTapShowCategories(_ sender: Any) {
        categoriesNewsImageView.tintColor = .red
        mainNewsImageView.tintColor = .white
        searchNewsImageView.tintColor = .white
        
        showCollectionViewHeightConstraint.priority = UILayoutPriority(rawValue: 900)
   
    }
    
    
}

extension NewsListViewController {
    
    @objc func refreshData() {
       
        pageNumber = 1
        news.removeAll()
        tableView.reloadData()
//        realmService.deleteNews()
        newsRequest()
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
