//
//  Post.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit
import ObjectMapper
import RealmSwift

public struct Post: Mappable {
    
    public var id: Int = 0
    public var userId: Int = 0
    public var title: String = ""
    public var body: String = ""
    public var favorite: Bool = false
    public var read: Bool = false
    
    public init?(map: Map) {}
    public init() {}
    
    public mutating func mapping(map: Map){
        id <- map["id"]
        userId <- map["userId"]
        title <- map["title"]
        body <- map["body"]
        favorite <- (map["favorite"], BoolTransform())
        read <- (map["read"], BoolTransform())
    }
    
}

