//
//  MainController.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit
import RealmSwift
import ObjectMapper

extension MainViewController {
    
    func fetchPosts() {
        playAnimateView()
        postStore.fecthPost { response in
            if let posts = response {
                self.posts = posts
            } else {
                guard let objects = Default.posts() else { return }
                guard let posts = Mapper<Post>().mapArray(JSONObject: objects) else { return }
                self.posts = posts
                print("Error")
            }
            self.stopAnimate()
        }
    }
    
}
