//
//  HomeViewController.swift
//  CTask
//
//  Created by akshay on 3/6/20.
//  Copyright © 2020 akshay. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var viewModel : HomeViewModel = {
        let viewModel = HomeViewModel()
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.setupTableView()
        self.setUpNavigation()
        
        // add error handling example
        self.viewModel.onErrorHandling = { [weak self] error in
            // display error ?
            let controller = UIAlertController(title: "An error occured", message: "Oops, something went wrong!", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self?.present(controller, animated: true, completion: nil)
        }
        
        // add error handling example
        self.viewModel.onDidFinish = { [weak self] in
            // display error ?
            self?.tableview.reloadData()
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
        
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor)
        ])
        
    }
    
    private func setUpNavigation() {
        self.navigationItem.title = "Canada"
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 0.24, green: 0.76, blue: 0.83, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)]
    }
    
}


extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : HomeTableViewCell = tableview.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {return UITableViewCell()}
        cell.backgroundColor = UIColor.white
        cell.row = self.viewModel.rows[indexPath.row]
        return cell
    }
    
    
}




