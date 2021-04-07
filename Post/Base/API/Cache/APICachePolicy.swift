//
//  APICachePolicy.swift
//  TestPost
//
//  Created by Leonardo Mendez on 4/6/21.
//

import Foundation

enum APICachePolicy {
    case networkOnly
    case cacheOnly
    case networkElseCache
    case cacheThenNetwork
    
    func isCache() -> Bool {
        if self == .networkOnly || self == .networkElseCache { return false }
        return true
    }
}
