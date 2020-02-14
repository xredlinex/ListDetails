//
//  NewsListViewController+TableView.swift
//  ListDetails
//
//  Created by alexey sorochan on 11.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.updateNewsCell(news[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       

        if news.count < maxCount && indexPath.row >= news.count - 1 {
            pageNumber += 1
            isLoadedNews = false
            self.newsRequest()
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        add code to next page
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if category != "" {
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
            let label = UILabel(frame: view.frame)
            label.text = category
            label.textAlignment = .center
            label.textColor = .white
            label.layer.backgroundColor = UIColor(red: 43/255, green: 46/255, blue: 65/255, alpha: 1).cgColor
            label.font = UIFont.boldSystemFont(ofSize: 17)
            label.text = label.text?.uppercased()
            view.addSubview(label)
         return view
        }
        return view
    }
    
    
}
