//
//  CategoriesCollectionViewCell.swift
//  ListDetails
//
//  Created by alexey sorochan on 14.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoriesView: UIView!
    @IBOutlet weak var categoriesImageView: UIImageView!
    @IBOutlet weak var categoriesTextLalbel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupForCategoriesCell()
    }

}




extension CategoriesCollectionViewCell {
    
    func setupForCategoriesCell() {
        
        categoriesView.clipsToBounds = true
        categoriesView.layer.cornerRadius = categoriesView.frame.width / 2
        categoriesView.layer.borderWidth = 2
        categoriesView.layer.borderColor = UIColor.red.cgColor
        
        
    }
    
}

extension CategoriesCollectionViewCell {
    
    func updateCategoriesCell(_ categories: NewsCategories) {
        
        
        
        categoriesImageView.image = UIImage(named: categories.categoryImage ?? "")
        categoriesTextLalbel.text = categories.categoryName ?? ""
    }
}
