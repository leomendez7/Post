//
//  DetailsViewController.swift
//  Post
//
//  Created by Leonardo Mendez on 4/8/21.
//

import UIKit
import ObjectMapper

class DetailsViewController: BaseViewController {
    
    var userStore = UserStore()
    var post = Post()
    var user = User() {
        didSet {
            configureUserInformation()
        }
    }

    @IBOutlet var titlePostLabel: UILabel!
    @IBOutlet var bodyPostLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userUserNameLabel: UILabel!
    @IBOutlet var userEmailLabel: UILabel!
    @IBOutlet var userAddressLabel: UILabel!
    @IBOutlet var userPhoneLabel: UILabel!
    @IBOutlet var userWebsiteLabel: UILabel!
    @IBOutlet var userCompanyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureBackButton(title: "DETAILS")
        fetchUserInformation()
    }
    
    func configureUserInformation() {
        titlePostLabel.text = post.title
        bodyPostLabel.text = post.body
        userNameLabel.text = user.name
        userUserNameLabel.text = user.username
        userEmailLabel.text = user.email
        userAddressLabel.text = "\(user.address.street), \(user.address.suite), \(user.address.city)"
        userPhoneLabel.text = user.phone
        userWebsiteLabel.text = user.website
        userCompanyLabel.text = user.company.name
        stopAnimate()
    }
    
}
