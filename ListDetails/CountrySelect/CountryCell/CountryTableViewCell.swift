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
        
        countryView.setupForView(style: .systemUltraThinMaterialLight)
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
