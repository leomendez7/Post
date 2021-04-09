//
//  PostDefault.swift
//  Post
//
//  Created by Leonardo Mendez on 4/7/21.
//

import UIKit

extension Default {
    
    static func posts() -> [[String: Any]]? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: Default.Key.post.rawValue) as? [[String: Any]]
    }
    
    static func save(posts: [[String: Any]]!) {
        let defaults = UserDefaults.standard
        defaults.set(posts, forKey: Default.Key.post.rawValue)
    }
    
    static func favorite() -> [[String: Any]]? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: Default.Key.favorite.rawValue) as? [[String: Any]]
    }
    
    static func save(favorite: [[String: Any]]!) {
        let defaults = UserDefaults.standard
        defaults.set(favorite, forKey: Default.Key.favorite.rawValue)
    }
    
}
