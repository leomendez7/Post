//
//  DefaultServerType.swift
//  CurbsideSOS
//
//  Created by Leonardo Mendez on 10/1/19.
//  Copyright © 2019 Koombea. All rights reserved.
//

import UIKit

extension Default {
    
    static func serverType() -> ServerType {
        let defaults = UserDefaults.standard
        guard let rawValue = defaults.object(forKey: Default.Key.serverType.rawValue) as? String else { return .develop }
        return ServerType(rawValue: rawValue) ?? .develop
    }
    
    static func save(serverType: ServerType) {
        let defaults = UserDefaults.standard
        defaults.set(serverType.rawValue, forKey: Default.Key.serverType.rawValue)
    }
    
}

enum ServerType: String {
    
    case develop
    
    var apiConfig: APIConfig {
        switch self {
        case .develop: return .development
        }
    }
    
}
