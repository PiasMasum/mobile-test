//
//  APIClient.swift
//  MobileTest
//
//  Created by Pias on 4/21/19.
//  Copyright © 2019 Pias. All rights reserved.
//

import Foundation

class APIClient {
    
    typealias completionHandler = ([AnyObject]?, Error?) -> Void
    
    func getData(completion: @escaping completionHandler){
        
        if let path = Bundle.main.path(forResource: "categories", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)

                if let jsonResult = jsonResult  as? [AnyObject] {
                    completion(jsonResult, nil)
                }

            } catch {
                
            }
        }
        
    }
    
    
}
