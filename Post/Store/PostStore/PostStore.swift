//
//  PostStore.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit
import Alamofire
import ObjectMapper

struct PostStore {
    
    func postRouter() -> Router {
        let request = PostRouter.post
        return request
    }
    
    func fecthPost( _ completion: @escaping(_ post: Post?) -> Void) {
        AF.request(postRouter()).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                if let value = value  as? [String: Any] {
                    let post = Mapper<Post>().map(JSON: value)
                    DispatchQueue.main.async{
                        completion(post)
                    }
                } else {
                    DispatchQueue.main.async{
                        completion(nil)
                    }
                }
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
    
}
