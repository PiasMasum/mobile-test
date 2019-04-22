//
//  ResourceViewController.swift
//  MobileTest
//
//  Created by Pias on 4/21/19.
//  Copyright © 2019 Pias. All rights reserved.
//

import UIKit
import SDWebImage

class ResourceViewController: UIViewController {

    var tableView: UITableView?
    let apiClient = APIClient()
    var sortAscending: Bool = true
    
    var resourcViewModels = NSMutableArray()
    var resourceURL: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Resources"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortTapped))
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .plain)
        self.tableView?.register(ResourceTableViewCell.self, forCellReuseIdentifier: "resourceCell")
        self.tableView?.tableFooterView = UIView()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
        
        apiClient.getData(url: resourceURL!) { (json, error) in
            for dict in json! {
                let resource = Resource(fromDictionary: dict as! [String : Any])
                let viewModel = ResourceViewModel(resource: resource)
                self.resourcViewModels.add(viewModel)
            }
            self.tableView?.reloadData()
        }

    }
    @objc func sortTapped(){
        var sortedResource = NSMutableArray()
        if sortAscending {
            sortAscending = false
            sortedResource = self.resourcViewModels.sorted { ($0 as! ResourceViewModel).title < ($1 as! ResourceViewModel).title } as! NSMutableArray
        }else {
            sortAscending = true
            sortedResource = self.resourcViewModels.sorted { ($0 as AnyObject).title > ($1 as AnyObject).title } as! NSMutableArray


        }
        self.resourcViewModels = sortedResource as! NSMutableArray
        self.tableView?.reloadData()
        
    }
    
}

extension ResourceViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resourcViewModels.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "resourceCell", for: indexPath) as! ResourceTableViewCell
        
        let resourceViewModel = self.resourcViewModels[indexPath.row] as? ResourceViewModel
        cell.title?.text = resourceViewModel?.resource.title
        
        cell.imageView?.sd_setImage(with: URL(string: resourceViewModel!.photo), completed: nil)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let resourceViewModel = self.resourcViewModels[indexPath.row] as? ResourceViewModel
        detailVC.resourceViewModel = resourceViewModel
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
    
}
