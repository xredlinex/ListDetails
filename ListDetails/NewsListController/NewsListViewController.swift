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
    
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var searchBarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchTextField: UITextField!
    
    let realmService = RealmService.shared
    var news: [NewsArticlesModel] = []
    var newsCategories: [NewsCategories] = []
    
    var keyword: String?
    var category: String?
    var country: String = "ua"
    var link: String?
    
    
    var pageNumber: Int = 1
    var pageSize: Int = 10
    var maxCount: Int = 100
    var isLoadedNews = true
    var isSearchNews = false
    let apikey = "df23a739ff1045119ffd367b733c0c58"
    
    

    var ifConnect = false
    
    var refreshControll = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        defaultValues()
        newsCategories = NewsCategoriesList().getCategories()
        
        
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
        debugPrint("-----------------------")
        debugPrint(country)
        debugPrint(link)
        debugPrint(category)
        debugPrint("-----------------------")
        
        
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
        
        searchTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchTextField.text = ""
    }
    
    
    
    
    @IBAction func didTapSelectCountryActionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Country", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CountrySortViewController") as! CountrySortViewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapMainNewsActionButton(_ sender: Any) {
//        debugPrint(country, "first")
//        country = "us"
//        debugPrint(country, "not first")
//        debugPrint(category)
//        category = nil
//        keyword = nil
//        debugPrint(category)
        
        defaultValues()
        pageNumber = 1
        isLoadedNews = false
        news.removeAll()
        tableView.reloadData()

        newsRequest()


        
        
    }
    
    
    @IBAction func didTapSowSearchActionButton(_ sender: Any) {
        searchValues()
        
    }
    
    
    @IBAction func didTapShowCategories(_ sender: Any) {
       categoriesValues()
   
    }
    
    @IBAction func searchNewsActionButton(_ sender: Any) {
        debugPrint("tap")
        debugPrint(searchTextField.text)
        
        if let searchKeyword = searchTextField.text, searchKeyword != "" {
//                 link = "http://newsapi.org/v2/everything?"
//            country.isEmpty = true
//            category = nil
            debugPrint("start search")
            debugPrint(apikey)
            debugPrint(link)
            keyword = searchKeyword
            pageNumber = 1
            isLoadedNews = false
                newsRequest()
       
            
            
                 
                 
        }
             
        
        
        
        
        
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


extension NewsListViewController {
    
    func defaultValues() {
        isSearchNews = false
        category = ""
        keyword = ""
        link = "https://newsapi.org/v2/top-headlines?"
        showCollectionViewHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        searchBarHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        mainNewsImageView.tintColor = .red
        
        searchNewsImageView.tintColor = .white
        categoriesNewsImageView.tintColor = .white
    }
    
    func searchValues() {
        isSearchNews = true
        link = "http://newsapi.org/v2/everything?"
        searchNewsImageView.tintColor = .red
        mainNewsImageView.tintColor = .white
        categoriesNewsImageView.tintColor = .white
        searchBarHeightConstraint.priority = UILayoutPriority(rawValue: 900)
        showCollectionViewHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        
    }
    
    func categoriesValues() {
        
        isSearchNews = false
        keyword = ""
        link = "https://newsapi.org/v2/top-headlines?"
        categoriesNewsImageView.tintColor = .red
        mainNewsImageView.tintColor = .white
        searchNewsImageView.tintColor = .white
        searchBarHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        showCollectionViewHeightConstraint.priority = UILayoutPriority(rawValue: 900)
    }
    
    
    
}
