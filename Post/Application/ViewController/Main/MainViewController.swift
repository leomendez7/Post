//
//  MainViewController.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit
import ObjectMapper

class MainViewController: BaseViewController {

    enum Segue: String {
        case showDetails
    }
    
    var showFavorites = false
    var postStore = PostStore()
    var tableData = [Post]()
    var selectPost = Post()
    var favorites = [Post]()
    var posts = [Post]() {
        didSet {
            tableData.removeAll()
            let objects = Default.favorite() ?? [["":""]]
            let favorites = Mapper<Post>().mapArray(JSONObject: objects) ?? []
            for favorite in favorites {
                if let row = self.posts.firstIndex(where: { $0.id == favorite.id }) {
                    posts[row] = favorite
                }
            }
            tableData = self.posts
            tableView.reloadData()
        }
    }
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var showFavoriteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPosts()
    }

    @IBAction func refresh(_ sender: Any) {
        fetchPosts()
    }
    
    @IBAction func favorites(_ sender: Any) {
        showFavorites = true
        tableData.removeAll()
        self.favorites.removeAll()
        guard let objects = Default.favorite() else { return }
        guard let favorites = Mapper<Post>().mapArray(JSONObject: objects) else { return }
        self.favorites = favorites
        tableData = self.favorites
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? DetailsViewController {
            viewController.post = selectPost
        }
    }
    
}

