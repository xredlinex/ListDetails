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

//  MARK:- CUSTOM TABBAR VALUES - 
extension NewsListViewController {
    
    func loadNewsValues(search: Bool, collectionValue: Float, searchValue: Float, searchColor: UIColor, mainColor: UIColor, catColor: UIColor) {
        
        if !search {
            keyword = ""
        }
        pageNumber = 1
        isSearchNews = search
        link = (isSearchNews ? "https://newsapi.org/v2/everything?" : "https://newsapi.org/v2/top-headlines?")
        
        categoriesNewsImageView.tintColor = catColor
        mainNewsImageView.tintColor = mainColor
        searchNewsImageView.tintColor = searchColor
        searchBarHeightConstraint.priority = UILayoutPriority(rawValue: searchValue)
        showCollectionViewHeightConstraint.priority = UILayoutPriority(rawValue: collectionValue)
        searchBarView.clipsToBounds = true
        searchBarView.layer.cornerRadius = 12
    }
}

//  MARK: - TEXT FIELD DELEGATE -
extension NewsListViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
//
        searchNews()
        return true
    }
}

//  MARK: - SEARCH NEWS AND LOAD MAIN NEWS -
extension NewsListViewController {
    
    func loadMainNews() {
        debugPrint("load main news")
        country = "us"
        category = ""
        loadNewsValues(search: false, collectionValue: 600, searchValue: 600, searchColor: .white, mainColor: .red, catColor: .white)
        news.removeAll()
        tableView.reloadData()
//        isLoadedNews = false
//        newsRequest()
        networkConnectRequesrt()
    }
    
    func searchNews() {
        
        if let searchKeyword = searchTextField.text, searchKeyword != "" {
            debugPrint("load search news")
            keyword = searchKeyword
            searchTextField.text = ""
            searchTextField.resignFirstResponder()
//            isLoadedNews = false
            news.removeAll()
//            newsRequest()
            networkConnectRequesrt()
            
        } else {
            presentErrorAlert(title: "Error", errorAlert.errorKey(.emtyField))
        }
    }
}

//  MARK: - REFRESH CONTROL - 
extension NewsListViewController {
    
    func refreshControl() {
        
        refreshControll.attributedTitle = NSAttributedString(string: "updating news", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        refreshControll.tintColor = .white
        refreshControll.addTarget(self, action: #selector(refreshData), for: UIControl.Event.valueChanged)
    }
    
    @objc func refreshData() {
        
        pageNumber = 1
        news.removeAll()
//        newsRequest()
        networkConnectRequesrt()
        refreshControll.endRefreshing()
    }
}

//  MARK: - ERROR ALERT PRESENT -
extension NewsListViewController {
    
    func presentErrorAlert(title: String,_ message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}

//  MARK: -  NEWS HEADER NAME -
extension NewsListViewController {
    
    func showHeaderTitle() -> String {
     
//        re-edit logic !!!!!!!!!
        var newsCatText = "TOP NEWS"
        if category == "" && !isSearchNews {
            newsCatText = "TOP NEWS"
        } else if isSearchNews == true {
            newsCatText = "SEARCH NEWS"
        } else if category != "" {
            newsCatText = category ?? "TOP NEWS"/* + country*/
        }
        
        return newsCatText
    }
    
    func headerView() -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let label = UILabel(frame: view.frame)
        label.text = showHeaderTitle()
        label.textAlignment = .center
        label.textColor = .white
        label.layer.backgroundColor = UIColor(red: 43/255, green: 46/255, blue: 65/255, alpha: 1).cgColor
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = label.text?.uppercased()
        view.addSubview(label)
        return view
    }
}




//  MARK: - SELECT CATEGORIES NEWS -
extension NewsListViewController {
    
    func didSelectCategoty(_ categoryName: String) {
        country = ""
        pageNumber = 1
        category = categoryName
        news.removeAll()
//        newsRequest()
        networkConnectRequesrt()
        tableView.reloadData()
    }
}
