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
    @IBOutlet weak var newsFrameView: UIView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleTextLabel: UILabel!
    @IBOutlet weak var newsDescriptionTextLabel: UILabel!
    @IBOutlet weak var newsAuthorTextLabel: UILabel!
    @IBOutlet weak var newsPublishAtTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        newsCellView.setupForView(style: .dark)
    }
}

extension NewsTableViewCell {
    
    func updateNewsCell(_ news: NewsArticlesModel) {
        
        if let imgUrl = news.urlToImage {
            let url = URL(string: imgUrl)
            newsImageView.kf.setImage(with: url)
        } else {
            newsImageView.image = UIImage(named: "blankImage")
        }
        
        newsTitleTextLabel.text = news.title ?? "-"
        newsDescriptionTextLabel.text = news.description ?? "-"
        newsAuthorTextLabel.text = news.author ?? "-"
        newsPublishAtTextLabel.text = convertDate(news.publishedAt ?? "")
        newsFrameView.clipsToBounds = true
        newsFrameView.layer.cornerRadius = 12
    }
}
