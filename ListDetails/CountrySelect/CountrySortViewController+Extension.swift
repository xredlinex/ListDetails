//
//  CountrySortViewController+Extension.swift
//  ListDetails
//
//  Created by alexey sorochan on 13.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation
import UIKit
import FlagKit


extension CountrySortViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryCodeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as! CountryTableViewCell
        
        cell.showCountry(countryCodeList[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint("-----------------------------------------------")
        tableView.deselectRow(at: indexPath, animated: false)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsListViewController") as! NewsListViewController
        viewController.country = countryCodeList[indexPath.row]
        viewController.link = "https://newsapi.org/v2/top-headlines"
//        viewController.category = ""
//        viewController.keyword = ""
        

        navigationController?.pushViewController(viewController, animated: false)

    }
    
  
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
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


