//
//  NewsListViewController+CollectionView.swift
//  ListDetails
//
//  Created by alexey sorochan on 14.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit


extension NewsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        cell.updateCategoriesCell(newsCategories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        country = ""
//        pageNumber = 1
        category = newsCategories[indexPath.row].categoryName
        news.removeAll()
        newsRequest()
        tableView.reloadData()
//        showCollectionViewHeightConstraint.priority = UILayoutPriority(rawValue: 600)
        
        debugPrint(category)
        debugPrint(country)
        
    }
    
    
    
}

