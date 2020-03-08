//
//  HomeTableViewCell.swift
//  CTask
//
//  Created by Others on 07/03/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {
    
    //MARK: Properties
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
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 14)
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
            guard let row = row else {
                return
            }
            
            self.titleLabel.text = row.title ?? ""
            
            self.bodyLabel.text = row.description ?? ""
            
            if let image = row.imageHref{
                self.descImageView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "App-Default"),options: SDWebImageOptions(rawValue: 0), completed: { (image, error, cacheType, imageURL) in
                    // Perform operation.
                })
                
                
            }
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func  setupView(){
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descImageView)
        self.contentView.addSubview(bodyLabel)
        
        var allConstraints: [NSLayoutConstraint] = []
        
        let views: [String: Any] = [
            "title": titleLabel,
            "body": bodyLabel,
            "image": descImageView]
        
        let const1 = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-5-[image(40)]-5-[title]-5-|",
            metrics: nil,
            views: views)
        allConstraints += const1
        
        let const2 = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-5-[image]-5-[body]-5-|",
            metrics: nil,
            views: views)
        allConstraints += const2
        let const3 = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-5-[title]-5-[body]-(>=5)-|",
            metrics: nil,
            views: views)
        allConstraints += const3
        
        let const4 = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-5-[image(41)]-(>=5)-|",
            metrics: nil,
            views: views)
        allConstraints += const4
        
        
        self.contentView.addConstraints(allConstraints)
        
    }

}
