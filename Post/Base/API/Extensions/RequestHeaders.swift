//
//  NSMutableURLRequestHeaders.swift
//  TestPost
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit

extension URLRequest {
    
    mutating func addHTTPHeaders(_ headers: [String: String]?) {
        guard let headers = headers else { return }
        for (key, value) in headers {
            setValue(value, forHTTPHeaderField: key)
        }
    }
    
}
