//
//  NewsDetailViewController+Extension.swift
//  ListDetails
//
//  Created by alexey sorochan on 11.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher


extension NewsDetailViewController {
    
    func updateNewsDeatailInfo() {
        
        if let imgUrl = newsArticle.urlToImage {
            let url = URL(string: imgUrl)
            newsArticleImageView.kf.setImage(with: url)
        } else {
            newsArticleImageView.image = UIImage(named: "blankImage")
        }
        newsPublishAtTextLabel.text = converDate(newsArticle.publishedAt ?? "")
        newsAuthorTextLabel.text = newsArticle.author ?? ""
        newsTitleTextLabel.text = newsArticle.title ?? ""
        newsDescriptipnTextLabel.text = newsArticle.newsDescription
        newsContentTextLAbel.text = newsArticle.content ?? ""
    }
}

extension NewsDetailViewController {
    
    func setupDetailsUI() {
        newsContentView.setupForCell()
        shareView.setupForCell()
        visitWebView.setupForCell()
        
        if newsArticle.author != nil && newsArticle.author != "" {
            authorView.isHidden = false
            authorView.setupForCell()
        } else {
            authorView.isHidden = true
        }
    }
}

extension NewsDetailViewController {
    
    func converDate(_ date: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ssZ"
        let format = DateFormatter()
        format.dateFormat = "E, d MMM yyyy HH:mm"
        if let date = dateFormatter.date(from: date) {
            return format.string(from: date)
        } else {
            return ""
        }
    }
}


