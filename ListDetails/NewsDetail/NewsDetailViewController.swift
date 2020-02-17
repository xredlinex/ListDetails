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
        let shareNews = newsArticle.title ?? ""
        let shareLink = newsArticle.url ?? ""
        let viewController = UIActivityViewController(activityItems: [shareNews, shareLink], applicationActivities: [])
        present(viewController, animated: true)
    }
    
    @IBAction func visitWebActionButton(_ sender: Any) {
        if let url = URL(string: newsArticle.url ?? "") {
            UIApplication.shared.open(url)
        }
    }
}


