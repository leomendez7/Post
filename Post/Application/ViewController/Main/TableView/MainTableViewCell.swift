//
//  MainTableViewCell.swift
//  Post
//
//  Created by Leonardo Mendez on 4/7/21.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        
    }
    
    func configureCell(post: Post) {
        titleLabel.text = post.title.capitalizingFirstLetter()
        bodyLabel.text = post.body.capitalizingFirstLetter()
    }

}
