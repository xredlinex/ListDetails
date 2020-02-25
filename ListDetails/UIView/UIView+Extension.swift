//
//  Class+Extension.swift
//  ListDetails
//
//  Created by alexey sorochan on 11.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setupForView(style: UIBlurEffect.Style) {
//        let view = self
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.layer.cornerRadius = 6
        blurView.clipsToBounds = true
        self.insertSubview(blurView, at: 0)
        self.clipsToBounds = true
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 7, height: 7)
        self.layer.shadowRadius = 5
        self.isOpaque = true
        
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: self.heightAnchor),
                                     blurView.widthAnchor.constraint(equalTo: self.widthAnchor)])
    }
}
