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
            headerTitle = "SEARCH NEWS for key: \(keyword ?? "")"
            link = "https://newsapi.org/v2/everything?"
            parameters = ["q" : keyword ?? "",
                          "pageSize" : pageSize,
                          "page" : pageNumber]
        case .category:
            headerTitle = category
            link = "https://newsapi.org/v2/top-headlines?"
            parameters = ["country" : country,
                          "page" : pageNumber,
                          "category" : category,
                          "pageSize": pageSize]
            
        case .topNews:
            headerTitle = "\(getCountryName(country)) TOP NEWS"
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
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        textField.resignFirstResponder()
//    }
    
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
        tableView.reloadData()
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
    
    func getCountryName(_ country: String) -> String{
        if let countryName = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: country) {
            return countryName
        } else {
            return country
        }
    }

    func headerView() -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let label = UILabel(frame: view.frame)
        label.text = headerTitle
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
        tableView.reloadData()
    }
    
    func loadMainNews() {
        
        loadNewsValues(search: false,
                       collectionValue: 600,
                       searchValue: 600,
                       searchColor: .white,
                       mainColor: .red,
                       catColor: .white)
        
        pageNumber = 1
        getParameters(.topNews)
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
            tableView.reloadData()
            networkConnectRequesrt()
        } else {
            presentErrorAlert(title: "Error", errorAlert.errorKey(.emtyField))
        }
    }
}
