//
//  BaseViewController.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit
import Lottie
import ObjectMapper
import CoreLocation

class BaseViewController: UIViewController, CLLocationManagerDelegate {
    
    public var animationView: AnimationView = AnimationView(name: "loading")
    public let backgroundLoadingView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configureBackButton(title: "")
        configureBackgroundLoadingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        backgroundLoadingView.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    func configureNavigationBar() {
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.shadowImage = UIImage()
    }
    
    func configureBackButton(title: String? = "") {
        navigationController?.navigationBar.tintColor = ColorScheme.launchBackground
        navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "icon_back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "icon_back")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.imageInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    
    func configureBackgroundLoadingView() {
        backgroundLoadingView.backgroundColor = .white
        view.addSubview(backgroundLoadingView)
        let views = ["view": backgroundLoadingView]
        backgroundLoadingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
        backgroundLoadingView.isHidden = true
    }
    
    func configurateAnimationView() {
        configureBackgroundLoadingView()
        animationView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        backgroundLoadingView.addSubview(animationView, contentMode: .center)
        animationView.loopMode = .loop
    }
    
    func playAnimateView() {
        configurateAnimationView()
        backgroundLoadingView.isHidden = false
        animationView.play()
    }
    
    func stopAnimate() {
        animationView.stop()
        backgroundLoadingView.isHidden = true
    }
    
    public func addBackButton2() {
        navigationController?.navigationBar.tintColor = ColorScheme.launchBackground
        navigationController?.navigationBar.backgroundColor = .white
        let closeButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_back"), style: .plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    public func addCloseButton() {
        navigationController?.navigationBar.tintColor = ColorScheme.launchBackground
        navigationController?.navigationBar.backgroundColor = .white
        let closeButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_close"), style: .done, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    public func addCloseButton2() {
        navigationController?.navigationBar.tintColor = ColorScheme.launchBackground
        navigationController?.navigationBar.backgroundColor = .white
        let closeButton = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_close"), style: .done, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @IBAction func back(_ sender: Any? = nil) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func close(_ sender: Any? = nil) {
        navigationController?.dismiss(animated: true)
    }
    
}
