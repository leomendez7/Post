//
//  Company.swift
//  Post
//
//  Created by Leonardo Mendez on 4/8/21.
//

import UIKit
import ObjectMapper
import RealmSwift

public struct  Company: Mappable {
    
    public var name: String = ""
    public var catchPhrase: String = ""
    public var bs: String = ""
    
    public init?(map: Map) {}
    public init() {}
    
    public mutating func mapping(map: Map){
        name <- map["name"]
        catchPhrase <- map["catchPhrase"]
        bs <- map["bs"]
    }
    
}
