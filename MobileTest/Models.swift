//
//  Models.swift
//  MobileTest
//
//  Created by Pias on 4/21/19.
//  Copyright © 2019 Pias. All rights reserved.
//

import Foundation

class Category: NSObject {
    
    var v: Int!
    var active: Bool!
    var id: String!
    var createdAt: String!
    var customModuleEid: String!
    var descriptionField: String!
    var eid: String!
    var slug: String!
    var title: String!
    var updatedAt: String!
    
    init(fromDictionary dictionary: [String: Any]) {
        v = dictionary["__v"] as? Int
        active = dictionary["__active"] as? Bool
        id = dictionary["_id"] as? String
        createdAt = dictionary["created_at"] as? String
        customModuleEid = dictionary["custom_module_eid"] as? String
        descriptionField = dictionary["description"] as? String
        eid = dictionary["eid"] as? String
        slug = dictionary["slug"] as? String
        title = dictionary["title"] as? String
        updatedAt = dictionary["updated_at"] as? String
        
    }
    
    
}
