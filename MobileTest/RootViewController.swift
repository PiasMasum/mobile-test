//
//  RootViewController.swift
//  MobileTest
//
//  Created by Pias on 4/21/19.
//  Copyright © 2019 Pias. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var tableView: UITableView?
    let apiClient = APIClient()
    
    var categoryViewModels = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Category"
        self.view.backgroundColor = .red
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .plain)
        self.tableView?.register(CategoryTableViewCell.self, forCellReuseIdentifier: "categoryCell")
        self.tableView?.tableFooterView = UIView()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
        
        apiClient.getData(url: "categories") { (json, error) in
            for dict in json! {
                let category = Category(fromDictionary: dict as! [String : Any])
                let viewModel = CategoryViewModel(category: category)
                self.categoryViewModels.add(viewModel)
            }
            self.tableView?.reloadData()
        }
        
//        apiClient.getData(url: "categories", completion: { (json, error) in
//
//            for dict in json! {
//                let category = Category(fromDictionary: dict as! [String : Any])
//                let viewModel = CategoryViewModel(category: category)
//                self.categoryViewModels.add(viewModel)
//            }
//            self.tableView?.reloadData()
//        }

        // Do any additional setup after loading the view.
    }
}


extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryViewModels.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        let categoryViewModel = self.categoryViewModels[indexPath.row] as? CategoryViewModel
        
        cell.titleLabel?.text = categoryViewModel?.title
        
        if let descripitonText = categoryViewModel?.description {
            cell.descriptionLabel?.text = descripitonText
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resourceVC = ResourceViewController()

        if indexPath.row == 0 {
            resourceVC.resourceURL = "restaurants"
        }else if indexPath.row == 1 {
            resourceVC.resourceURL = "vacation-spot"
        }
        
        self.navigationController?.pushViewController(resourceVC, animated: true)
    }
    
    
    
    
}
