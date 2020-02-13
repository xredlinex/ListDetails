////
////  ContriesModel.swift
////  ListDetails
////
////  Created by alexey sorochan on 13.02.2020.
////  Copyright © 2020 alexey sorochan. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//enum Countries: String, CaseIterable {
//    
//    case ae
//    case ar
//    case at
//    case au
//    case be
//    case ca
//    case ch
//    case cn
//    case co
//    case cu
//    case cz
//    case de
//    case eg
//    case fr
//    case gb
//    case gr
//    case hk
//    case hu
//    case id
//    case ie
//    case il
//    case `in`
//    case it
//    case jp
//    case kr
//    case lt
//    case lv
//    case ma
//    case mx
//    case my
//    case ng
//    case nl
//    case no
//    case nz
//    case ph
//    case pl
//    case pt
//    case ro
//    case rs
//    case ru
//    case sa
//    case se
//    case sg
//    case si
//    case sk
//    case th
//    case tr
//    case tw
//    case ua
//    case us
//    case ve
//    case za
//    
//    init() {
//        self = .ae
//        self = .ar
//        self = .at
//        self = .au
//        self = .be
//        self = .ca
//        self = .ch
//        self = .cn
//        self = .co
//        self = .cu
//        self = .cz
//        self = .de
//        self = .eg
//        self = .fr
//        self = .gb
//        self = .gr
//        self = .hk
//        self = .hu
//        self = .id
//        self = .ie
//        self = .il
//        self = .in
//        self = .it
//        self = .jp
//        self = .kr
//        self = .lt
//        self = .lv
//        self = .ma
//        self = .mx
//        self = .my
//        self = .ng
//        self = .nl
//        self = .no
//        self = .nz
//        self = .ph
//        self = .pl
//        self = .pt
//        self = .ro
//        self = .rs
//        self = .ru
//        self = .sa
//        self = .se
//        self = .sg
//        self = .si
//        self = .sk
//        self = .th
//        self = .tr
//        self = .tw
//        self = .ua
//        self = .us
//        self = .ve
//        self = .za
//    }
//    var countryName: String {
//       switch self {
//       case .ae: return "United Arab Emirates"
//       case .ar: return "Argentina"
//       case .at: return "Austria"
//       case .au: return "Australia"
//       case .be: return "Belgium"
//       case .ca: return "Canada"
//       case .ch: return "Switzerland"
//       case .cn: return "China"
//       case .co: return "Colombia"
//       case .cu: return "Cuba"
//       case .cz: return "Czechia"
//       case .de: return "Germany"
//       case .eg: return "Egypt"
//       case .fr: return "France"
//       case .gb: return "United Kingdom of Great Britain and Northern Ireland"
//       case .gr: return "Greece"
//       case .hk: return "Hong Kong"
//       case .hu: return "Hungary"
//       case .id: return "Indonesia"
//       case .ie: return "Ireland"
//       case .il: return "Israel"
//       case .`in`: return "India"
//       case .it: return "Italy"
//       case .jp: return "Japan"
//       case .kr: return "Korea"
//       case .lt: return "Lithuania"
//       case .lv: return "Latvia"
//       case .ma: return "Morocco"
//       case .mx: return "Mexico"
//       case .my: return "Malaysia"
//       case .ng: return "Nigeria"
//       case .nl: return "Netherlands"
//       case .no: return "Norway"
//       case .nz: return "New Zealand"
//       case .ph: return "Philippines"
//       case .pl: return "Poland"
//       case .pt: return "Portugal"
//       case .ro: return "Romania"
//       case .rs: return "Serbia"
//       case .ru: return "Russian Federation"
//       case .sa: return "Saudi Arabia"
//       case .se: return "Sweden"
//       case .sg: return "Singapore"
//       case .si: return "Slovenia"
//       case .sk: return "Slovakia"
//       case .th: return "Thailand"
//       case .tr: return "Turkey"
//       case .tw: return "Taiwan"
//       case .ua: return "Ukraine"
//       case .us: return "United States of America"
//       case .ve: return "Venezuela"
//       case .za: return "South Africa"
//    }
//
//
//}
//
//
//
//
//
////class Countries {
////    var countryName: String?
////    var countryCode: String?
////}
////
////enum CountriesCode: String, CaseIterable {
////
////        case ae = "United Arab Emirates"
////        case ar = "Argentina"
////        case at = "Austria"
////        case au = "Australia"
////        case be = "Belgium"
////        case ca = "Canada"
////        case ch = "Switzerland"
////        case cn = "China"
////        case co = "Colombia"
////        case cu = "Cuba"
////        case cz = "Czechia"
////        case de = "Germany"
////        case eg = "Egypt"
////        case fr = "France"
////        case gb = "United Kingdom of Great Britain and Northern Ireland"
////        case gr = "Greece"
////        case hk = "Hong Kong"
////        case hu = "Hungary"
////        case id = "Indonesia"
////        case ie = "Ireland"
////        case il = "Israel"
////        case `in` = "India"
////        case it = "Italy"
////        case jp = "Japan"
////        case kr = "Korea"
////        case lt = "Lithuania"
////        case lv = "Latvia"
////        case ma = "Morocco"
////        case mx = "Mexico"
////        case my = "Malaysia"
////        case ng = "Nigeria"
////        case nl = "Netherlands"
////        case no = "Norway"
////        case nz = "New Zealand"
////        case ph = "Philippines"
////        case pl = "Poland"
////        case pt = "Portugal"
////        case ro = "Romania"
////        case rs = "Serbia"
////        case ru = "Russian Federation"
////        case sa = "Saudi Arabia"
////        case se = "Sweden"
////        case sg = "Singapore"
////        case si = "Slovenia"
////        case sk = "Slovakia"
////        case th = "Thailand"
////        case tr = "Turkey"
////        case tw = "Taiwan"
////        case ua = "Ukraine"
////        case us = "United States of America"
////        case ve = "Venezuela"
////        case za = "South Africa"
////
////}
////
////class GetCountries {
////
////    func getCountries() -> [String] {
////
////        var countries: [CountriesCode.Type] = [ae, ar, at, au, be, ca, ch, cn, co, cu, cz, de, eg, fr, gb, gr, hk, hu, id, ie, il, `in`, it, jp, kr, lt, lv, ma, mx, my, ng, nl, no, nz, ph, pl, pt, ro, rs, ru, sa, se, sg, si, sk, th, tr, tw, ua, us, ve, za]
////
////    return countries
////}
////
////
//
////import UIKit
////
////enum CountriesCode: String, CaseIterable {
////
////        case ae = "United Arab Emirates"
////        case ar = "Argentina"
////        case at = "Austria"
////        case au = "Australia"
////        case be = "Belgium"
////        case ca = "Canada"
////        case ch = "Switzerland"
////        case cn = "China"
////        case co = "Colombia"
////        case cu = "Cuba"
////        case cz = "Czechia"
////        case de = "Germany"
////        case eg = "Egypt"
////        case fr = "France"
////        case gb = "United Kingdom of Great Britain and Northern Ireland"
////        case gr = "Greece"
////        case hk = "Hong Kong"
////        case hu = "Hungary"
////        case id = "Indonesia"
////        case ie = "Ireland"
////        case il = "Israel"
////        case `in` = "India"
////        case it = "Italy"
////        case jp = "Japan"
////        case kr = "Korea"
////        case lt = "Lithuania"
////        case lv = "Latvia"
////        case ma = "Morocco"
////        case mx = "Mexico"
////        case my = "Malaysia"
////        case ng = "Nigeria"
////        case nl = "Netherlands"
////        case no = "Norway"
////        case nz = "New Zealand"
////        case ph = "Philippines"
////        case pl = "Poland"
////        case pt = "Portugal"
////        case ro = "Romania"
////        case rs = "Serbia"
////        case ru = "Russian Federation"
////        case sa = "Saudi Arabia"
////        case se = "Sweden"
////        case sg = "Singapore"
////        case si = "Slovenia"
////        case sk = "Slovakia"
////        case th = "Thailand"
////        case tr = "Turkey"
////        case tw = "Taiwan"
////        case ua = "Ukraine"
////        case us = "United States of America"
////        case ve = "Venezuela"
////        case za = "South Africa"
////
////    static let allCountries = [ae, ar, at,  au, be, ca, ch, cn, co, cu, cz, de, eg, fr, gb, gr, hk, hu, id, ie, il, `in`, it, jp, kr, lt, lv, ma, mx, my, ng, nl, no, nz, ph, pl, pt, ro, rs, ru, sa, se, sg, si, sk, th, tr, tw, ua, us, ve, za]
////
////    var description: String {
////        get {
////            return self.rawValue
////        }
////    }
////
////
////    func country() -> String {
////        return self.rawValue
////    }
////
////
////
////
////}
////
////class Country {
////
////
//////    func country() -> String {
//////
//////    }
//////
////}
////
////
//////
//////enum Country {
//////    static var allCountries: [Country] {
//////        return [.ae, .ar, .at, .au, .be, .ca, .ch, .cn, .co, .cu, .cz, .de, .eg, .fr, .gb, .gr, .hk, .hu, .id, .ie, .il, .`in`, .it, .jp, .kr, .lt, .lv, .ma, .mx, .my, .ng, .nl, .no, .nz, .ph, .pl, .pt, .ro, .rs, .ru, .sa, .se, .sg, .si, .sk, .th, .tr, .tw, .ua, .us, .ve, .za]
//////    }
//////
//////
//////
//////    case ae: return "United Arab Emirates"
//////    case ar = "Argentina"
//////    case at = "Austria"
//////    case au = "Australia"
//////    case be = "Belgium"
//////    case ca = "Canada"
//////    case ch = "Switzerland"
//////    case cn = "China"
//////    case co = "Colombia"
//////    case cu = "Cuba"
//////    case cz = "Czechia"
//////    case de = "Germany"
//////    case eg = "Egypt"
//////    case fr = "France"
//////    case gb = "United Kingdom of Great Britain and Northern Ireland"
//////    case gr = "Greece"
//////    case hk = "Hong Kong"
//////    case hu = "Hungary"
//////    case id = "Indonesia"
//////    case ie = "Ireland"
//////    case il = "Israel"
//////    case `in` = "India"
//////    case it = "Italy"
//////    case jp = "Japan"
//////    case kr = "Korea"
//////    case lt = "Lithuania"
//////    case lv = "Latvia"
//////    case ma = "Morocco"
//////    case mx = "Mexico"
//////    case my = "Malaysia"
//////    case ng = "Nigeria"
//////    case nl = "Netherlands"
//////    case no = "Norway"
//////    case nz = "New Zealand"
//////    case ph = "Philippines"
//////    case pl = "Poland"
//////    case pt = "Portugal"
//////    case ro = "Romania"
//////    case rs = "Serbia"
//////    case ru = "Russian Federation"
//////    case sa = "Saudi Arabia"
//////    case se = "Sweden"
//////    case sg = "Singapore"
//////    case si = "Slovenia"
//////    case sk = "Slovakia"
//////    case th = "Thailand"
//////    case tr = "Turkey"
//////    case tw = "Taiwan"
//////    case ua = "Ukraine"
//////    case us = "United States of America"
//////    case ve = "Venezuela"
//////    case za = "South Africa"
//////}
//}
