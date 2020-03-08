//
//  HomeViewModel.swift
//  CTask
//
//  Created by Others on 07/03/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import Foundation



class HomeViewModel {
    
    weak var service: DataServiceProtocol?
    
    var onErrorHandling : ((ErrorResult?) -> Void)?
    
    var onDidFinish : (()->())?
    
    var converter : Converter?{
        didSet{
            if let converter = converter{
                self.rows = converter.rows
                self.onDidFinish?()
            }
        }
    }
    
    public var rows : [Row] = [Row]()
    
    init(service: DataServiceProtocol = DataService.shared) {
        self.service = service
    }
    
    func fetchCurrencies() {
        
        guard let service = service else {
            onErrorHandling?(ErrorResult.custom(string: "Missing service"))
            return
        }
        
        service.fetchConverter { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let converter) :
                    print("Final Converter ===> \(converter)")
                    self.converter = converter
                case .failure(let error) :
                    self.onErrorHandling?(error)
                }
            }
        }
    }
}
