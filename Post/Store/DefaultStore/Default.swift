//
//  Default.swift
//  CurbsideSOS
//
//  Created by Leonardo Mendez on 5/22/19.
//  Copyright © 2019 Koombea. All rights reserved.
//

import UIKit

struct Default {
    
    enum Key: String {
        case post
    }
    
    static func destroySession(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: Key.post.rawValue)
    }

}

