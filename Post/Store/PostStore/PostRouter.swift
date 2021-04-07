//
//  PostRouter.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import ObjectMapper

enum PostRouter: Router {
    
    case post
    
    var config: APIConfig {
        return serverDomain()
    }
    
    var query: APIQuery {
        switch(self) {
        case .post:
            return APIQuery(httpMethod: .get, path: "/posts")
        }
    }
    
}
