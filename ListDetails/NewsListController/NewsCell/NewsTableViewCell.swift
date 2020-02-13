//
//  NewsTableViewCell.swift
//  ListDetails
//
//  Created by alexey sorochan on 11.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var newsImageView: UIImageView!

    @IBOutlet weak var newsTitleTextLabel: UILabel!
    
    @IBOutlet weak var newsDescriptionTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    
}

extension NewsTableViewCell {
    
    func updateNewsCell(_ news: NewsArticlesModel) {
        
        if let imgUrl = news.urlToImage {
            if let url = URL(string: imgUrl) {
                newsImageView.kf.setImage(with: url)
            }
        }
        
        newsTitleTextLabel.text = news.title ?? "-"
        newsDescriptionTextLabel.text = news.newsDescription
    }
    
 
}
