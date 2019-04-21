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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .plain)
        self.tableView?.register(CategoryTableViewCell.self, forCellReuseIdentifier: "categoryCell")
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
        
        apiClient.getData { (json, error) in
            
        }

        // Do any additional setup after loading the view.
    }
}


extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        cell.titleLabel?.text = "hello"
        cell.descriptionLabel?.text = "hi"
        
        return cell
    }
    
    
    
    
}
