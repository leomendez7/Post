//
//  UserDefault.swift
//  Post
//
//  Created by Leonardo Mendez on 4/8/21.
//

import UIKit

extension Default {
    
    static func user() -> [String: Any]? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: Default.Key.user.rawValue) as? [String: Any]
    }
    
    static func save(user: [String: Any]!) {
        let defaults = UserDefaults.standard
        defaults.set(user, forKey: Default.Key.user.rawValue)
    }
    
}
