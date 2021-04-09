//
//  DetailsController.swift
//  Post
//
//  Created by Leonardo Mendez on 4/8/21.
//

import UIKit
import ObjectMapper

extension DetailsViewController {
    
    func fetchUserInformation() {
        playAnimateView()
        userStore.fetchUserInformation(id: "\(post.userId)") { response in
            if let user = response {
                self.user = user
            } else {
                guard let objects = Default.user() else { return }
                guard let user = Mapper<User>().map(JSON: objects) else { return }
                self.user = user
            }
        }
    }
    
}
