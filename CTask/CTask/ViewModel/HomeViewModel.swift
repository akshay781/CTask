//
//  HomeViewModel.swift
//  CTask
//
//  Created by Others on 07/03/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import Foundation



struct HomeViewModel {
    
    weak var service: DataServiceProtocol?
    
    var onErrorHandling : ((ErrorResult?) -> Void)?
    
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
                case .failure(let error) :
                    self.onErrorHandling?(error)
                }
            }
        }
    }
}
