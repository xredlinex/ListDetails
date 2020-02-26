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
            newsArticleImageView.image = UIImage(named: "blank")
        }
        newsPublishAtTextLabel.text = convertDate(newsArticle.publishedAt ?? "")
        newsAuthorTextLabel.text = newsArticle.author ?? ""
        newsTitleTextLabel.text = newsArticle.title ?? ""
        newsDescriptipnTextLabel.text = newsArticle.description
        newsContentTextLAbel.text = textContentValidate(newsArticle.content ?? "")
    }
}

//  MARK: - UI DESIGN - 
extension NewsDetailViewController {
    
    func setupDetailsUI() {
        
        newsContentView.setupForView(style: .dark)
        shareView.setupForView(style: .dark)
        visitWebView.setupForView(style: .dark)
        
        if newsArticle.author != nil && newsArticle.author != "" {
            authorView.isHidden = false
            authorView.setupForView(style: .dark)
        } else {
            authorView.isHidden = true
        }
    }
}

//  MARK: - CONVERT DATE -
extension NewsDetailViewController {
    
    func convertDate(_ date: String) -> String {
        
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

extension NewsDetailViewController {
    
    func textContentValidate(_ text: String) -> String {
        return text.count >= 260 ? text : "Visit Web Page To See Full Article Context"
    }
}


