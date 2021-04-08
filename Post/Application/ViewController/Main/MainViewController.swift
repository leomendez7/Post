//
//  MainViewController.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit

class MainViewController: BaseViewController {

    var postStore = PostStore()
    var tableData = [Post]()
    var posts = [Post]() {
        didSet {
            DispatchQueue.main.async{
                self.tableData = self.posts
                self.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPosts()
    }

    @IBAction func refresh(_ sender: Any) {
        fetchPosts()
    }
    
    @IBAction func favorites(_ sender: Any) {
        
    }
    
}

