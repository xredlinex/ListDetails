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



extension NewsListViewController {
    
    enum RequestParametes {
        
        case search
        case category
        case topNews
        
    }
    
    func getParameters(_ req: RequestParametes) {
        switch req {
        case .search:
            link = "https://newsapi.org/v2/everything?"
            parameters = ["q" : keyword ?? "",
                          "pageSize" : pageSize,
                          "page" : pageNumber]
        case .category:
            link = "https://newsapi.org/v2/top-headlines?"
            parameters = ["country" : country,
                          "page" : pageNumber,
                          "category" : category ?? "",
                          "pageSize": pageSize]
        case .topNews:
            link = "https://newsapi.org/v2/top-headlines?"
            parameters = ["country" : country,
                          "page": pageNumber,
                          "pageSize" : pageSize]
            
        }
    }
}

//  MARK:- CUSTOM TABBAR VALUES - 
extension NewsListViewController {
    
    func loadNewsValues(search: Bool, collectionValue: Float, searchValue: Float, searchColor: UIColor, mainColor: UIColor, catColor: UIColor) {
        


        pageNumber = 1
        isSearchNews = search
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
        searchNews()
        return true
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
    
    
//    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! EDIT   !!!!!!!!!!!!!!!!!!!!!!!!!!!!
    func showHeaderTitle() -> String {
     
        var newsCatText = "TOP NEWS"
        var newsCountry = ""
        
        if let name = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: country) {
            newsCountry = name
        }
        
        
//        re-edit logic !!!!!!!!!
        
        if category == "" && !isSearchNews {
            newsCatText = "TOP NEWS \(newsCountry)"
        } else if isSearchNews == true {
            newsCatText = "SEARCH NEWS"
        } else if category != "" {
            newsCatText = "\(category ?? ""), \(newsCountry)"
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
        
        pageNumber = 1
        category = categoryName
        getParameters(.category)
        news.removeAll()
        networkConnectRequesrt()
        debugPrint(parameters)
        tableView.reloadData()
    }
}


//  MARK: - SEARCH NEWS AND LOAD MAIN NEWS -
extension NewsListViewController {
    
    func loadMainNews() {
        pageNumber = 1
        getParameters(.topNews)
        
        loadNewsValues(search: false,
                       collectionValue: 600,
                       searchValue: 600,
                       searchColor: .white,
                       mainColor: .red,
                       catColor: .white)
        news.removeAll()
        tableView.reloadData()
        networkConnectRequesrt()
    }
    
    func searchNews() {
        
        if let searchKeyword = searchTextField.text, searchKeyword != "" {
            keyword = searchKeyword
            getParameters(.search)
            searchTextField.text = ""
            searchTextField.resignFirstResponder()
            news.removeAll()
            networkConnectRequesrt()
        } else {
            presentErrorAlert(title: "Error", errorAlert.errorKey(.emtyField))
        }
    }
}
