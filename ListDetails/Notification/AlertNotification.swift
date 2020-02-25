//
//  AlertNotification.swift
//  ListDetails
//
//  Created by alexey sorochan on 23.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation

class AlertErrors {
    
    enum ErrorText {
        case emtyField
        case noLink
        case noInternet
        case noNews
    }
    
    func errorKey(_ error: ErrorText) -> String {
        
        switch error {
        case .emtyField:
            return "News Search Field Is Empty"
        case .noLink:
            return "Sorry, Bad Request"
        case .noInternet:
            return "No Internet Connection!"
        case .noNews:
            return "No News Recieved"
        }
    }
}
