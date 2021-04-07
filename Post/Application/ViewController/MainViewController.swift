//
//  MainViewController.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit

class MainViewController: BaseViewController {

    var postStore = PostStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPost()
    }


}

