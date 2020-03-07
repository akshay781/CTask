//
//  ErrorResult.swift
//  CTask
//
//  Created by akshay on 3/6/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import Foundation


enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}
