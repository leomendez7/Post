//
//  Router.swift
//  TestPost
//
//  Created by Leonardo Mendez on 4/6/21.
//

import Foundation
import Alamofire

protocol Router: URLRequestConvertible {
    var config: APIConfig { get }
    var query: APIQuery { get }
}

extension Router {
    
    func serverDomain() -> APIConfig {
        return Default.serverType().apiConfig
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try config.source.host.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(query.path))
        urlRequest.httpMethod = query.httpMethod.rawValue
        urlRequest.addHTTPHeaders(config.source.headers)
        urlRequest.addHTTPHeaders(query.headers)
        let encoding = query.paremeterEncoding
        print ("\(query.httpMethod.rawValue) \(try encoding.encode(urlRequest, with: query.parameters))")
        return try encoding.encode(urlRequest, with: query.parameters)
    }
 
}
