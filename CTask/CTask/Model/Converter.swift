//
//  Converter.swift
//  CTask
//
//  Created by akshay on 3/6/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import Foundation


struct Converter {
    let base : String
    let date : String
    
    let rates : [CurrencyRate]
}


extension Converter : Parceable{
    
    static func parseObject(dictionary: [String : Any]) -> Result<Converter, ErrorResult> {
        if let base = dictionary["base"] as? String,
            let date = dictionary["date"] as? String,
            let rates = dictionary["rates"] as? [String: Double] {
            
            let finalRates : [CurrencyRate] = rates.flatMap({ CurrencyRate(currencyIso: $0.key, rate: $0.value) })
            let conversion = Converter(base: base, date: date, rates: finalRates)
            
            return Result.success(conversion)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse conversion rate"))
        }
    }
    
    
    //    static func parseObject(dictionary: [String : AnyObject]) -> Result<Converter, ErrorResult> {
    //        if let base = dictionary["base"] as? String,
    //            let date = dictionary["date"] as? String,
    //            let rates = dictionary["rates"] as? [String: Double] {
    //
    //            let finalRates : [CurrencyRate] = rates.flatMap({ CurrencyRate(currencyIso: $0.key, rate: $0.value) })
    //            let conversion = Converter(base: base, date: date, rates: finalRates)
    //
    //            return Result.success(conversion)
    //        } else {
    //            return Result.failure(ErrorResult.parser(string: "Unable to parse conversion rate"))
    //        }
    //    }
    
}
