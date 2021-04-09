//
//  MainTableViewCell.swift
//  Post
//
//  Created by Leonardo Mendez on 4/7/21.
//

import UIKit

protocol FavoriteMainTableViewCellDelegate: class {
    func addFavorite(_ potition: Int)
    func removeFavorite(_ postId: Int)
}

class MainTableViewCell: UITableViewCell {
    
    weak var delegate: FavoriteMainTableViewCellDelegate?
    var potition = Int()
    var post = Post()
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    @IBOutlet var backgroundCellView: UIView!
    @IBOutlet var addFavoriteButton: UIButton!
    @IBOutlet var removeFavoriteButton: UIButton!
    
    override func awakeFromNib() {
        
    }
    
    func configureCell(post: Post, row: Int) {
        potition = row
        self.post = post
        titleLabel.text = post.title.capitalizingFirstLetter()
        bodyLabel.text = post.body.capitalizingFirstLetter()
        if row % 2 == 0 {
            backgroundCellView.backgroundColor = .white
        } else {
            backgroundCellView.backgroundColor = ColorScheme.ligthGrayView
        }
        if post.favorite {
            removeFavoriteButton.isHidden = false
            addFavoriteButton.isHidden = true
        } else {
            removeFavoriteButton.isHidden = true
            addFavoriteButton.isHidden = false
        }
    }

    @IBAction func addFavorite(_ sender: Any) {
        delegate?.addFavorite(potition)
    }
    
    @IBAction func removeFavorite(_ sender: Any) {
        delegate?.removeFavorite(post.id)
    }
    
}
