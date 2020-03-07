//
//  Currency.swift
//  CTask
//
//  Created by akshay on 3/6/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import Foundation


enum Currency : String {
    case EUR
    case GBP
    case USD
}

enum CurrencyLocale : String {
    case EUR = "fr_FR"
    case GBP = "en_UK"
}

struct CurrencyRate {
    
    let currencyIso : String
    let rate : Double
}
