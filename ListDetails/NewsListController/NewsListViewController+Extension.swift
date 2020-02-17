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
    
    func searchNews() {
        
        if let searchKeyword = searchTextField.text, keyword != "" {
            
            keyword = searchKeyword
            
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
