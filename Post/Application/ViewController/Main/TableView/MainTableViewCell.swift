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
    @IBOutlet var readLabel: UILabel!
    
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
        removeFavoriteButton.isHidden = !post.favorite
        addFavoriteButton.isHidden = post.favorite
        readLabel.isHidden = post.read
    }

    @IBAction func addFavorite(_ sender: Any) {
        delegate?.addFavorite(potition)
    }
    
    @IBAction func removeFavorite(_ sender: Any) {
        delegate?.removeFavorite(post.id)
    }
    
}
