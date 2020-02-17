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
    
    @IBOutlet weak var newsCellView: UIView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleTextLabel: UILabel!
    @IBOutlet weak var newsDescriptionTextLabel: UILabel!
    @IBOutlet weak var newMarkTextLabel: NSLayoutConstraint!
    @IBOutlet weak var newsAuthorTextLabel: UILabel!
    @IBOutlet weak var newsPublishAtTextLabel: UILabel!
    @IBOutlet weak var freshNewsLabel: UILabel!
    @IBOutlet weak var showFreshNewsHeightContstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newsCellView.setupForCell()
    }
}

extension NewsTableViewCell {
    
    func updateNewsCell(_ news: NewsArticlesModel) {
        
        if let imgUrl = news.urlToImage {
            if let url = URL(string: imgUrl) {
                newsImageView.kf.setImage(with: url)
            }
        }
        newNewsDate(news.publishedAt ?? "")
        newsTitleTextLabel.text = news.title ?? "-"
        newsDescriptionTextLabel.text = news.newsDescription ?? "-"
        newsAuthorTextLabel.text = news.author ?? "-"
        newsPublishAtTextLabel.text = converDate(news.publishedAt ?? "")
    }
}
