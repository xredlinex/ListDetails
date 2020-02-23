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
import Toast_Swift
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
    
    let apikey = "df23a739ff1045119ffd367b733c0c58"
    var keyword: String?
    var category: String?
    var country: String = "us"
    var link: String?
    
    var pageNumber: Int = 1
    var pageSize: Int = 10
    var maxCount: Int = 100
    var isLoadedNews = true
    var isSearchNews = false
//    var ifConnect: Bool?
    
    var refreshControll = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsCategories = NewsCategoriesList().getCategories()
        networkConnectRequesrt()
//        defaultValues()
        
        values(search: false,
               collectionValue: 600,
               searchValue: 600,
               searchColor: .white,
               mainColor: .red,
               catColor: .white)
        
        refreshControl()
        
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
        mainNews()
    }
    
    
    @IBAction func didTapSowSearchActionButton(_ sender: Any) {
        values(search: true,
               collectionValue: 600,
               searchValue: 900,
               searchColor: .red,
               mainColor: .white,
               catColor: .white)
    }
    
    
    @IBAction func didTapShowCategories(_ sender: Any) {
//        categoriesValues()
        values(search: false,
        collectionValue: 900,
        searchValue: 600,
        searchColor: .white,
        mainColor: .white,
        catColor: .red)
        
    }
    
    @IBAction func searchNewsActionButton(_ sender: Any) {
        searchNews()
    }
}
