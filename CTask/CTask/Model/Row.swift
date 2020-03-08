//
//  Row.swift
//  CTask
//
//  Created by akshay on 3/6/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import Foundation


struct Row : Codable {
    
    var title : String?
    var description : String?
    var imageHref : String?
    
}

extension Row {
    
    init?(fromDict: [String: Any]) {
        let title =  fromDict["title"] as? String
        let description =  fromDict["description"] as? String
        let imageHref =  fromDict["imageHref"] as? String
        if title == nil && description == nil && imageHref == nil {
            return nil
        }
        self.title = title
        self.description = description
        self.imageHref = imageHref
    }
}
