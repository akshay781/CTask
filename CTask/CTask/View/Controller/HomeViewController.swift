//
//  HomeViewController.swift
//  CTask
//
//  Created by akshay on 3/6/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let dataSource = RowDataSource()
    
    lazy var viewModel : HomeViewModel = {
        let viewModel = HomeViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupTableView()
        self.setUpNavigation()
        
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        // add error handling
        self.viewModel.onErrorHandling = { [weak self] error in
            // display error ?
            let controller = UIAlertController(title: "An error occured", message: "Oops, something went wrong!", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self?.present(controller, animated: true, completion: nil)
        }
        
        // update UI on succesful
        self.viewModel.onDidFinish = { [weak self] in
            self?.title = self?.viewModel.navTitle
        }
        
        self.viewModel.fetchCurrencies()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    private func setupTableView(){
        
        self.tableView.dataSource = self.dataSource
    
        self.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor)
        ])
        
    }
    
    private func setUpNavigation() {
        
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 0.24, green: 0.76, blue: 0.83, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)]
    }
    
}





