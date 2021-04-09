//
//  PostStore.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit
import Alamofire
import ObjectMapper
import RealmSwift

struct PostStore {

    func fecthPost( _ completion: @escaping(_ post: [Post]?) -> Void) {
        guard let url = URL(string: "\(DataService.sharedInstance.baseUrl)/posts") else { return }
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                if let value = value as? [[String: Any]] {
                    DispatchQueue.main.async {
                        var posts = Mapper<Post>().mapArray(JSONArray: value)
                        for i in 0...19 {
                            posts[i].read = false
                        }
                        let defaults = UserDefaults.standard
                        defaults.removeObject(forKey: Default.Key.post.rawValue)
                        Default.save(posts: posts.toJSON())
                        completion(posts)
                    }
                } else {
                    DispatchQueue.main.async {
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
