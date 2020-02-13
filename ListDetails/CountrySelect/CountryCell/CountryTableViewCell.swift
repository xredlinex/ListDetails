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
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CountryTableViewCell {
    
    func showCountry(_ countryCode: String) {
        
        countryFlagImageView.image = Flag(countryCode: countryCode.uppercased())?.image(style: .roundedRect)
        
        
        debugPrint()
        
        if let name = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: countryCode) {
            countryNameTextLabel.text = name
        } else {
            countryNameTextLabel.text = "zimbbwaa"
        }
        
        
        
        
        
    }
}
