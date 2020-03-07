//
//  DataService.swift
//  CTask
//
//  Created by akshay on 3/6/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import Foundation


protocol DataServiceProtocol : class {
    func fetchConverter(_ completion: @escaping ((Result<Converter, ErrorResult>) -> Void))
}

final class DataService : RequestHandler, DataServiceProtocol {
    
    static let shared = DataService()
    
    let endpoint = "https://api.fixer.io/latest?base=GBP"
    var task : URLSessionTask?
    
    func fetchConverter(_ completion: @escaping ((Result<Converter, ErrorResult>) -> Void)) {
        
        // cancel previous request if already in progress
        self.cancelFetchCurrencies()
        
        task = RequestService().loadData(urlString: endpoint, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchCurrencies() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
