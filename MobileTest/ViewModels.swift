//
//  ViewModels.swift
//  MobileTest
//
//  Created by Pias on 4/21/19.
//  Copyright © 2019 Pias. All rights reserved.
//

import Foundation

class CategoryViewModel {
    let category: Category
    
    var title: String {
        return category.title
    }
    
    var description: String {
        if category.descriptionField != nil {
            return category.descriptionField
        } else {
            return ""
        }
    }
    
    init(category: Category) {
        self.category = category
    }
}

class ResourceViewModel {
    let resource: Resource
    
    var title: String {
        if resource.title != nil {
            return resource.title
        }else {
            return ""
        }
    }
    
    var photo: String {
        if resource.photo != nil {
            return resource.photo
        }else {
            return ""
        }
    }
    
    var phoneNumber: String {
        return resource.contactInfo.phoneNumber
    }
    
    var tollFreeNumber: String {
        if let toll = resource.contactInfo.tollFree {
            return toll
        }else {
            return ""
        }
    }
    
    var faxNumber: String {
        if let fax = resource.contactInfo.faxNumber {
            return fax
        }else {
            return ""
        }
    }
    
    var emailAddress: String {
        if (resource.contactInfo.email != nil){
            return resource.contactInfo.email
        }else {
            return ""
        }
    }
    
    var website: String {
        if (resource.contactInfo.website != nil) {
            return resource.contactInfo.website
        } else {
            return ""
        }
    }
    
    var address: String {
        if (resource.address != nil && resource.address.address != nil) {
            let addrs = String(format: "%@ %@ %@ %@ %@ %@",resource.address.address, resource.address.label, resource.address.zipCode, resource.address.city, resource.address.state, resource.address.country )
            return addrs
        } else {
            return ""
        }

    }
    
    var facebookLink: String {
        if (resource.socialMedia != nil) {
            return resource.socialMedia.facebook
        }else {
            return ""
        }
    }
    
    var twitterLink: String {
        if (resource.socialMedia != nil) {
            return resource.socialMedia.twiter
        }else {
            return ""
        }
    }
    
    var youtubeLink: String {
        if (resource.socialMedia != nil) {
            return resource.socialMedia.youtubeChannel
        }else {
            return ""
        }
    }
    
    var sundayBizHours: String {
        if (resource.bizHours != nil){
            let hours = String(format: "%@ %@", resource.bizHours.sunday.from, resource.bizHours.sunday.to)
            return hours
        } else {
            return ""
        }
    }
    
    var mondayBizHours: String {
        if (resource.bizHours != nil){
            let hours = String(format: "%@ %@", resource.bizHours.monday.from, resource.bizHours.monday.to)
            return hours
        } else {
            return ""
        }
    }
    
    var latitude: String {
        if resource.address != nil {
            if resource.address.gps != nil {
                return resource.address.gps.latitude
            }else {
                return "0"
            }
        } else {
            return "0"
        }
    }
    
    var longitude: String {
        if resource.address != nil {
            if resource.address.gps != nil {
                return resource.address.gps.latitude
            }else {
                return "0"
            }
        } else {
            return "0"
        }
    }
    
    
    
    init(resource: Resource) {
        self.resource = resource
    }
}
