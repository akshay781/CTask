//
//  HomeViewModel.swift
//  CTask
//
//  Created by Others on 07/03/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    //MARK: Properties
    weak var dataSource : GenericDataSource<Row>?
    weak var service: DataServiceProtocol?
    
    var converter : Converter?{
        didSet{
            if let converter = converter{
                self.navTitle = converter.title
                self.dataSource?.data.value = converter.rows
            }
        }
    }
    
    private(set) var navTitle : String?
    
    //MARK: Closures
    var onErrorHandling : ((ErrorResult?) -> Void)?
    
    init(service: DataServiceProtocol = DataService.shared, dataSource : GenericDataSource<Row>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchRows() {
        
        guard let service = service else {
            onErrorHandling?(ErrorResult.custom(string: "Missing service"))
            return
        }
        
        service.fetchConverter { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let converter) :
                    //print("Final Converter ===> \(converter)")
                    self.converter = converter
                    
                case .failure(let error) :
                    self.onErrorHandling?(error)
                }
            }
        }
    }
}
