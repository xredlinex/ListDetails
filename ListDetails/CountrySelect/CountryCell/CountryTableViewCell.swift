//
//  CountryTableViewCell.swift
//  ListDetails
//
//  Created by alexey sorochan on 13.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit
import FlagKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryNameTextLabel: UILabel!
    @IBOutlet weak var countryFlagImageView: UIImageView!
    @IBOutlet weak var countryView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        uiSetupForCell()
    }
}

extension CountryTableViewCell {
    
    func showCountry(_ countryCode: String) {
        
        countryFlagImageView.image = Flag(countryCode: countryCode.uppercased())?.image(style: .roundedRect)
        if let name = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: countryCode) {
            countryNameTextLabel.text = name
        } else {
            countryNameTextLabel.text = "zimbbwaa"
        }
    }
}

extension CountryTableViewCell {
    
    func uiSetupForCell() {
        
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.layer.cornerRadius = 6
        blurView.clipsToBounds = true
        countryView.insertSubview(blurView, at: 0)
        countryView.clipsToBounds = true
        countryView.layer.cornerRadius = 6
        countryView.layer.masksToBounds = false
        countryView.layer.shadowColor = UIColor.black.cgColor
        countryView.layer.shadowOpacity = 0.2
        countryView.layer.shadowOffset = CGSize(width: 7, height: 7)
        countryView.layer.shadowRadius = 5
        countryView.isOpaque = true
        
        NSLayoutConstraint.activate([blurView.heightAnchor.constraint(equalTo: countryView.heightAnchor),
                                     blurView.widthAnchor.constraint(equalTo: countryView.widthAnchor)])
    }
}
