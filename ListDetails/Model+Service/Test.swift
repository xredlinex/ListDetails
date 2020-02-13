//
//  Test.swift
//  ListDetails
//
//  Created by alexey sorochan on 13.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import Foundation

class Countries {
    
    enum CountryCodes: String, CaseIterable {
        case ae, ar, at, au, be, ca, ch, cn, co, cu, cz, de, eg, fr, gb, gr, hk, hu, id, ie, il, `in`, it, jp, kr, lt, lv, ma, mx, my, ng, nl, no, nz, ph, pl, pt, ro, rs, ru, sa, se, sg, si, sk, th, tr, tw, ua, us, ve, za
    }
    
    func requestCountries(_ code: String) -> String{
        
        
      if let name = (Locale.current as NSLocale).displayName(forKey: .countryCode, value: code) {
        return name
      } else {
        return code
    }
        
        //      var countries: [String] = []
        //
        //        for code in NSLocale.isoCountryCodes  {
        //            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
        //            let name = NSLocale(localeIdentifier: "enUK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
        //            countries.append(id)
        //        }
        
    }
    
}
        
//        let eg = "eg"
//        let ar = "ar", at = "at", au = "au", be = "be", ca = "ca", ch = "ch", cn = "cn", co = "co", cu = "cu", cz = "cz", de = "de", eg = "eg", fr = "fr", gb = "gb", gr = "gr", hk = "hk", hu = "hu", id = "id", ie = "ie", il = "il", `in` = "in", it = "it", jp = "jp", kr = "kr", lt = "lt", lv = "lv", ma = "ma", mx = "mx", my = "my", ng = "ng", nl = "nl", no = "no", nz = "nz", ph = "ph", pl = "pl", pt = "pt", ro = "ro", rs = "rs", ru = "ru", sa = "sa", se = "se", sg = "sg", si = "si", sk = "sk", th = "th", tr = "tr", tw = "tw", ua = "ua", us = "us", ve = "ve", za = "za"
//    }
//    
//    
//}



//
//
//enum Countries: String , CaseIterable {
//    case eg = "Egypt"
//    case fr = "France"
//    case de = "Germany"
//    case co = "Colombia"
//    case ca = "Canada"
//    case cn = "China"
//    case it = "Italy"
//    case jp = "Japan"
//    case ma = "Morocco"
//    case ng = "Nigeria"
//    case ru = "Russia"
//    case sa = "Saudi Arabia"
//    case kr = "South Korea"
//    case ae = "UAE"
//    case us = "United States"
//    case gb = "United Kingdom"
//    case ve = "Venezuela"
//    case br = "Brazil"
//    case ie = "Ireland"
//    case se = "Sweden"
//    case ch = "Switzerland"
//    case pt = "Portugal"
//    case ro = "Romania"
//    case mx = "Mexico"
//    case nz = "New Zealand"
//    case no = "Norway"
//    case ar = "Argentina"
//    case be = "Belgium"
//    case nl = "Netherlands"
//    case hk = "Hong Kong"
//}
