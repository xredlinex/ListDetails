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

extension NewsListViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchNews()
        searchTextField.resignFirstResponder()
        return true
    }
}

extension NewsListViewController {
    
    func mainNews() {
        country = "us"
        category = ""
        
        values(search: false,
               collectionValue: 600,
               searchValue: 600,
               searchColor: .white,
               mainColor: .white,
               catColor: .white)
        
        isLoadedNews = false
        news.removeAll()
        tableView.reloadData()
        newsRequest()
    }
    
    func searchNews() {
        
        if let searchKeyword = searchTextField.text, searchKeyword != "" {
            keyword = searchKeyword
            isLoadedNews = false
            news.removeAll()
            tableView.reloadData()
            newsRequest()
        } else {
            showErrorAlert("news search field is empty")
        }
    }
}

extension NewsListViewController {
    
    func refreshControl() {
        
        refreshControll.attributedTitle = NSAttributedString(string: "updating news", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        refreshControll.tintColor = .white
        refreshControll.addTarget(self, action: #selector(refreshData), for: UIControl.Event.valueChanged)
    }
}

extension NewsListViewController {
    
    @objc func refreshData() {
        
        pageNumber = 1
        news.removeAll()
        tableView.reloadData()
        newsRequest()
        refreshControll.endRefreshing()
    }
}


extension NewsListViewController {
    
    func values(search: Bool, collectionValue: Float, searchValue: Float, searchColor: UIColor, mainColor: UIColor, catColor: UIColor) {
        
        pageNumber = 1
        isSearchNews = search
        
        link = (isSearchNews ? "https://newsapi.org/v2/everything?" : "https://newsapi.org/v2/top-headlines?)")
        categoriesNewsImageView.tintColor = catColor
        mainNewsImageView.tintColor = mainColor
        searchNewsImageView.tintColor = searchColor
        searchBarHeightConstraint.priority = UILayoutPriority(rawValue: searchValue)
        showCollectionViewHeightConstraint.priority = UILayoutPriority(rawValue: collectionValue)
        
        if !search {
            keyword = ""
        }
    }
}
