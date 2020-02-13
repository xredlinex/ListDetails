//
//  CountrySortViewController.swift
//  ListDetails
//
//  Created by alexey sorochan on 13.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

class CountrySortViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var countryCodeList = (Countries.CountryCodes.allCases.map { $0.rawValue})
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    @IBAction func didTapGoBackActionButton(_ sender: Any) {
        
    }
    

}
