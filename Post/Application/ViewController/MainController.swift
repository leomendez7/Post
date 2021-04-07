//
//  MainController.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit

extension MainViewController {
    
    func fetchPost() {
        playAnimateView()
        postStore.fecthPost { response in
            if let post = response {
                print(post)
            } else {
                print("Error")
            }
            self.stopAnimate()
        }
    }
    
}
