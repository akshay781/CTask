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
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            let decoder = JSONDecoder()
            let finalData = try decoder.decode(Converter.self, from: data)
            
            return Result.success(finalData)
        }catch{
            return Result.failure(ErrorResult.parser(string: "Unable To Parse data"))
        }
    }
    
}
