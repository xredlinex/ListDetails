//
//  CountrySortViewController+Extension.swift
//  ListDetails
//
//  Created by alexey sorochan on 24.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit


extension CountrySortViewController {
    
    func viewForCountryHeader() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let label = UILabel(frame: view.frame)
        label.text = "Select News Region"
        label.textAlignment = .center
        label.textColor = .white
        label.layer.backgroundColor = UIColor(red: 43/255, green: 46/255, blue: 65/255, alpha: 1).cgColor
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = label.text?.uppercased()
        view.addSubview(label)
        return view
    }
}
