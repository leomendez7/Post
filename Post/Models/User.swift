//
//  User.swift
//  Post
//
//  Created by Leonardo Mendez on 4/8/21.
//

import UIKit
import ObjectMapper
import RealmSwift

public struct User: Mappable {
    
    public var id: Int = 0
    public var name: String = ""
    public var username: String = ""
    public var email: String = ""
    var address = Address()
    public var phone:  String = ""
    public var website:  String = ""
    var company = Company()
    
    public init?(map: Map) {}
    public init() {}
    
    public mutating func mapping(map: Map){
        id <- map["id"]
        name <- map["name"]
        username <- map["username"]
        email <- map["email"]
        address <- map["address"]
        phone <- (map["phone"])
        website <- (map["website"])
        company <- (map["company"])
    }
    
}
