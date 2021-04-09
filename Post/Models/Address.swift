//
//  Address.swift
//  Post
//
//  Created by Leonardo Mendez on 4/8/21.
//

import UIKit
import ObjectMapper
import RealmSwift

public struct  Address: Mappable {
    
    public var street: String = ""
    public var suite: String = ""
    public var city: String = ""
    public var zipcode: String = ""
    var geo = Geo()
    
    public init?(map: Map) {}
    public init() {}
    
    public mutating func mapping(map: Map){
        street <- map["street"]
        suite <- map["suite"]
        city <- map["city"]
        zipcode <- map["zipcode"]
        geo <- map["geo"]
    }
    
}

public struct Geo: Mappable {
    
    public var latitude: String = ""
    public var longitude: String = ""
    
    public init?(map: Map) {}
    public init() {}
    
    public mutating func mapping(map: Map){
        latitude <- map["lat"]
        longitude <- map["lng"]
    }
    
}
