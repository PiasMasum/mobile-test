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

class Resource {
    var v: Int!
    var active: Bool!
    var id: String!
    var address: Address!
    var bizHours: BizHour!
    var categoryEid: String!
    var contactInfo: ContactInfo!
    var createdAt: String!
    var description: String!
    var eid: String!
    var photo: String!
    var slug: String!
    var socialMedia: SocialMedia!
    var title: String!
    var updatedAt: String!
    
    init(fromDictionary dictionary: [String: Any]) {
        v = dictionary["__v"] as? Int
        active = dictionary["_active"] as? Bool
        id = dictionary["_id"] as? String
        categoryEid = dictionary["category_eid"] as? String
        createdAt = dictionary["created_at"] as? String
        description = dictionary["description"] as? String
        eid = dictionary["eid"] as? String
        photo = dictionary["photo"] as? String
        slug = dictionary["slug"] as? String
        title = dictionary["title"] as? String
        updatedAt = dictionary["updated_at"] as? String
        
        if let bizHoursData = dictionary["bizHours"] as? [String: Any]{
            bizHours = BizHour(fromDictionary: bizHoursData)
        }
        
        if let contactInfoData = dictionary["contactInfo"] as? [String: Any] {
            contactInfo = ContactInfo(fromDictionary: contactInfoData)
        }
        
        if let socialMediaData = dictionary["socialMedia"] as? [String: Any] {
            socialMedia = SocialMedia(fromDictionary: socialMediaData)
        }
        
        if let addressData = dictionary["addresses"] as? [[String: Any]] {
            address = Address(fromDictionary: addressData[0])
        }
    }
    
    
}

class Address{
    var address: String!
    var label: String!
    var zipCode: String!
    var city: String!
    var state: String!
    var country: String!
    var gps: Gps!
    
    init(fromDictionary dictionary: [String: Any]) {
        address = dictionary["address1"] as? String
        city = dictionary["city"] as? String
        country = dictionary["country"] as? String
        label = dictionary["label"] as? String
        state = dictionary["state"] as? String
        zipCode = dictionary["zipCode"] as? String
        
        if let gpsData = dictionary["gps"] as? [String: Any]{
            gps = Gps(fromDictionary: gpsData)
        }
    }

    
}

class Gps{
    var latitude: String!
    var longitude: String!
    init(fromDictionary dictionary: [String: Any]) {
        latitude = dictionary["latitude"] as? String
        longitude = dictionary["longitude"] as? String
    }
}

class BizHour{
    var monday: Day!
    var sunday: Day!
    
    init(fromDictionary dictionary: [String: Any]) {
        if let mondayData = dictionary["monday"] as? [String: Any]{
            monday = Day(fromDictionary: mondayData)
        }
        
        if let sundayData = dictionary["sunday"] as? [String: Any] {
            sunday = Day(fromDictionary: sundayData)
        }
    }
    
    
}

class Day{
    var from: String!
    var to: String!
    
    init(fromDictionary dictionary: [String: Any]) {
        from = dictionary["from"] as? String
        to = dictionary["to"] as? String
    }
}

class ContactInfo{
    var website: String!
    var email: String!
    var faxNumber: String!
    var tollFree: String!
    var phoneNumber: String!
    
    init(fromDictionary dictionary: [String: Any]) {
        if let web = dictionary["website"] as? [Any] {
            website = web[0] as? String
        }
        
        if let mail = dictionary["email"] as? [Any] {
            email = mail[0] as? String
        }
        
        if let fax = dictionary["faxNumber"] as? [Any] {
            faxNumber = fax[0] as? String

        }
        
        if let toll = dictionary["tollFree"] as? [Any] {
            tollFree = toll[0] as? String
        }
        
        if let phone = dictionary["phoneNumber"] as? [Any] {
            phoneNumber = phone[0] as? String
        }
        
    }
    
}

class SocialMedia{
    var facebook: String!
    var twiter: String!
    var youtubeChannel: String!
    
    init(fromDictionary dictionary: [String: Any]) {
        var fb = dictionary["facebook"] as? [Any]
        facebook = fb![0] as? String
        
        var ttr = dictionary["twitter"] as? [Any]
        twiter = ttr![0] as? String
        
        var yt = dictionary["youtubeChannel"] as? [Any]
        youtubeChannel = yt![0] as? String
        
    }
    
}
