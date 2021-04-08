//
//  Post.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit
import ObjectMapper
import RealmSwift

class Post: Object, Mappable {
    
    @objc public var id: Double = 0
    @objc public var userId: Double = 0
    @objc public var title: String = ""
    @objc public var body: String = ""
    @objc public var favorite: Bool = false
    @objc public var read: Bool = false
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map){
        id <- map["id"]
        userId <- map["userId"]
        title <- map["title"]
        body <- map["body"]
        favorite <- (map["favorite"], BoolTransform())
        read <- (map["read"], BoolTransform())
    }
    
}

