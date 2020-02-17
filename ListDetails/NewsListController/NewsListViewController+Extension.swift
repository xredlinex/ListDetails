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
        searchTextField.resignFirstResponder()
        return true
    }
}

extension NewsListViewController {
    
    func mainNews() {
        country = "us"
        defaultValues()
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
    
    func defaultValues() {
        
        isSearchNews = false
        category = ""
        keyword = ""
        pageNumber = 1
        link = "https://newsapi.org/v2/top-headlines?"
        showCollectionViewHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        searchBarHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        mainNewsImageView.tintColor = .red
        searchNewsImageView.tintColor = .white
        categoriesNewsImageView.tintColor = .white
    }
    
    func searchValues() {
        
        isSearchNews = true
        link = "https://newsapi.org/v2/everything?"
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

extension NewsListViewController {
    
    func refreshCoontrol() {
        
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
