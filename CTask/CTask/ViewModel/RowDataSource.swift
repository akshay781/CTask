//
//  RowDataSource.swift
//  CTask
//
//  Created by Others on 08/03/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import Foundation
import UIKit


class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}


class RowDataSource : GenericDataSource<Row>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier , for: indexPath) as! HomeTableViewCell
        
        let row = self.data.value[indexPath.row]
        cell.row = row
        
        return cell
    }
}
