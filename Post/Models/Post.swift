//
//  Post.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit
import ObjectMapper

public struct Post: Mappable {
    
    public var id: Double = 0
    public var userId: Double = 0
    public var title: String = ""
    public var body: String = ""
    
    public init?(map: Map) {}
    public init() {}
    
    public mutating func mapping(map: Map){
        id <- map["id"]
        userId <- map["userId"]
        title <- map["title"]
        body <- map["body"]
    }
    
}
