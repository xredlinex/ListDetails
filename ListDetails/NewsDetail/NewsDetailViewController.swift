//
//  NewsDetailViewController.swift
//  ListDetails
//
//  Created by alexey sorochan on 11.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import Kingfisher

class NewsDetailViewController: UIViewController {
    
    
    @IBOutlet weak var newsImageView: UIView!
    
    @IBOutlet weak var newsArticleImageView: UIImageView!
    @IBOutlet weak var newsAuthorTextLabel: UILabel!
    @IBOutlet weak var newsTitileView: UIView!

    @IBOutlet weak var newsPublishAtTextLabel: UILabel!
    
    @IBOutlet weak var newsTitleTextLabel: UILabel!
    
    @IBOutlet weak var newsDescriptipnTextLabel: UILabel!
    
    @IBOutlet weak var newsContentTextLAbel: UILabel!
    @IBOutlet weak var authorView: UIView!
    
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var visitWebView: UIView!
    @IBOutlet weak var newsContentView: UIView!
    var newsArticle = NewsArticlesModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateNewsDeatailInfo()
        setupDetailsUI()
        

    }
    @IBAction func didTapGoBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
        
        
        
    }
    
    @IBAction func shareActionButton(_ sender: Any) {
        
        
    }
    
    @IBAction func visitWebActionButton(_ sender: Any) {
    }
    
}


extension NewsDetailViewController {
    
    func updateNewsDeatailInfo() {
        
        if let imgUrl = newsArticle.urlToImage {
            let url = URL(string: imgUrl)
            newsArticleImageView.kf.setImage(with: url)
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
        
        
        
//        newsContentView.clipsToBounds = true
//        newsContentView.layer.cornerRadius = 10
//        shareView.layer.borderColor = UIColor.lightGray.cgColor
//        visitWebView.layer.borderColor = UIColor.lightGray.cgColor
//        shareView.layer.borderWidth = 1
//        visitWebView.layer.borderWidth = 1

        
        if newsArticle.author != nil && newsArticle.author != "" {
            debugPrint("not hide hide author view")
            authorView.isHidden = false
            authorView.setupForCell()
            
        } else {
            authorView.isHidden = true
        }
    
        
        
    }
    
}


func converDate(_ date: String) -> String {
       
       let dateFormatter = DateFormatter()
       dateFormatter.calendar = Calendar(identifier: .iso8601)
       dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ssZ"
       let format = DateFormatter()
       format.dateFormat = "E, d MMM yyyy HH:mm"
       if let date = dateFormatter.date(from: date) {
           return format.string(from: date)
       } else {
           return "-huhh-"
       }
   }

