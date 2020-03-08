//
//  Converter.swift
//  CTask
//
//  Created by akshay on 3/6/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import Foundation


struct Converter : Codable {
    
    let title : String
    let rows : [Row]
}


extension Converter : Parceable{
    
    static func parseObject(dictionary: [String : Any]) -> Result<Converter, ErrorResult> {
        //        do {
        //            let data = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
        //            let decoder = JSONDecoder()
        //            let finalData = try decoder.decode(Converter.self, from: data)
        //
        //            return Result.success(finalData)
        //        }catch{
        //            return Result.failure(ErrorResult.parser(string: "Unable To Parse data"))
        //        }
        
        if let title = dictionary["title"] as? String,
            let rows = dictionary["rows"] as? [[String: Any]] {
            
            let rows =  rows.compactMap { (v: [String: Any]) -> Row? in
                let title = v["title"] as? String
                let description = v["description"] as? String
                let imageHref = v["imageHref"] as? String
                if title == nil && description == nil && imageHref == nil {
                    return nil
                }
                return Row(title: title, description: description, imageHref: imageHref)
            }
            
            let conversion = Converter(title: title, rows: rows)
            return Result.success(conversion)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse conversion rate"))
        }
    }
    
}
