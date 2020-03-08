//
//  HomeTableViewCell.swift
//  CTask
//
//  Created by Others on 07/03/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    private let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let bodyLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let descImageView : UIImageView = {
        let imgView = UIImageView(image: nil)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        
        return imgView
    }()
    
    
    static var identifier : String{
        return String(describing: HomeTableViewCell.self)
    }
    
    var row : Row? {
        didSet{
            if let row = row {
                self.titleLabel.text = row.title ?? "title"
                self.bodyLabel.text = row.description ?? "Description"
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
