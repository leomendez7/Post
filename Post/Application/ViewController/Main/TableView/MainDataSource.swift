//
//  MainDataSource.swift
//  Post
//
//  Created by Leonardo Mendez on 4/7/21.
//

import UIKit
import ObjectMapper

extension MainViewController: UITableViewDataSource, UITableViewDelegate, FavoriteMainTableViewCellDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return tableData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell",
                                                                              for: indexPath) as? MainTableViewCell else { return MainTableViewCell() }
        cell.delegate = self
        cell.configureCell(post: tableData[indexPath.row], row: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectPost = tableData[indexPath.row]
        self.performSegue(withIdentifier: Segue.showDetails.rawValue, sender: self)
    }
    
    func addFavorite(_ potition: Int) {
        showFavorites = false
        var favorite = posts[potition]
        favorite.favorite = true
        favorites.append(favorite)
        Default.save(favorite: favorites.toJSON())
        updateFavorites()
        tableView.reloadData()
    }
    
    func removeFavorite(_ postId: Int) {
        if let index = favorites.firstIndex(where: { $0.id == postId }) {
            favorites.remove(at: index)
        }
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: Default.Key.favorite.rawValue)
        Default.save(favorite: favorites.toJSON())
        updateFavorites()
        tableView.reloadData()
    }
    
    func updateFavorites() {
        guard let objects = Default.favorite() else { return }
        guard let favorites = Mapper<Post>().mapArray(JSONObject: objects) else { return }
        self.favorites.removeAll()
        self.favorites = favorites
        if favorites.count == 0 {
            if let row = self.posts.firstIndex(where: { $0.favorite == true }) {
                posts[row].favorite = false
            }
        } else {
            for favorite in favorites {
                if let row = self.posts.firstIndex(where: { $0.id == favorite.id }) {
                    posts[row] = favorite
                }
            }
        }
        tableData.removeAll()
        if showFavorites {
            tableData = self.favorites
        } else {
            tableData = posts
        }
        emptyImage.isHidden = tableData.count == 0 ? false : true
    }
    
}
