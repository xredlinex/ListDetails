//
//  Class+Extension.swift
//  ListDetails
//
//  Created by alexey sorochan on 11.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit


//  MARK: - VIEW ELEMENTH ADD BLUR AND RADIUS -
extension UIView {
    
    func setupForView(style: UIBlurEffect.Style) {
        
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

//  MARK: - ADD GRADIENT LAYER TO CATEGORIES COLLECTION VIEW -
extension UIView {
    
    func setupForRoundLayer() {
        
        let firstColor = UIColor(red: 75/255, green: 102/255, blue: 124/255, alpha: 1).cgColor
        let secondColor = UIColor(red: 118/255, green: 59/255, blue: 90/255, alpha: 1).cgColor
        let lineWidth: CGFloat = 2
        let rect = self.bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: self.frame.size.width / 2)
        let gradient = CAGradientLayer()
        
        gradient.frame =  CGRect(origin: CGPoint.zero, size: self.frame.size)
        gradient.colors = [firstColor, secondColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        
        let shape = CAShapeLayer()
        shape.lineWidth = lineWidth
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        self.layer.addSublayer(gradient)
    }
}
