//
//  APIConfig.swift
//  TestPost
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit
import Alamofire

enum APIConfig {
    
    case development
    
    var source: (host: String, headers: [String: String]?) {
        switch self {
        case .development:
            return (host: "https://jsonplaceholder.typicode.com", headers: nil)
        }
    }

}
