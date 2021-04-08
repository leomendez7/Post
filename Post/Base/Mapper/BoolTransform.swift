//
//  BoolTransform.swift
//  CurbsideSOS
//
//  Created by Leonardo Mendez on 4/7/21.
//

import ObjectMapper

struct BoolTransform: TransformType {
    
    typealias Object = Bool
    typealias JSON = Bool
    
    func transformFromJSON(_ value: Any?) -> Object? {
        if let value = value as? Bool {
            return value
        }
        if let value = value as? Int {
            return value == 1
        }
        if let value = value as? String {
            return value == "true" || value == "1"
        }
        return false
    }
    
    func transformToJSON(_ value: Object?) -> JSON? {
        return value
    }
    
}

struct NullableBoolTransform: TransformType {
    
    typealias Object = Bool
    typealias JSON = Bool
    
    func transformFromJSON(_ value: Any?) -> Object? {
        guard value != nil else { return nil }
        if let value = value as? Bool {
            return value
        }
        if let value = value as? Int {
            return value == 1
        }
        if let value = value as? String {
            return value == "true" || value == "1"
        }
        return false
    }
    
    func transformToJSON(_ value: Object?) -> JSON? {
        return value
    }
    
}
