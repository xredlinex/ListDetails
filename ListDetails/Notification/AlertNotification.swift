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
        case badRequest
        case noMoreNews
        case noReq
    }
    
    func errorKey(_ error: ErrorText) -> String {
        
        switch error {
        case .emtyField:
            return "News Search Field Is Empty"
        case .noLink:
            return "Sorry, Cant Connect to Service"
        case .noInternet:
            return "No Internet Connection"
        case .noNews:
            return "No News Recieved"
        case .badRequest:
            return "Bad Request!"
        case .noMoreNews:
            return "All News Loaded"
        case .noReq:
            return  "Bad Request, No Recieve News or thmsg!"
        }
    }
}
