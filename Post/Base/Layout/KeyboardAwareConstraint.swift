//
//  KeyboardAwareViewController.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit

open class KeyboardAwareConstraint: NSLayoutConstraint {
    
    @IBInspectable public var extraBottomHeight: CGFloat = 0.0
    
    public var maxKeyboardHeight: CGFloat = 0.0
    
    public var containerView: UIView? {
        if let view = firstItem as? UIView {
            return view
        }
        if let guide = firstItem as? UILayoutGuide, let view = guide.owningView {
            return view
        }
        return nil
    }
    
    public var bottomInset: CGFloat {
        guard let guide = firstItem as? UILayoutGuide, let view = guide.owningView else {
            return 0
        }
        return view.safeAreaInsets.bottom
    }
    
    override init() {
        super.init()
        setup()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidChangeVisible(_:)),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidChangeVisible(_:)),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidChangeVisible(_:)),
                                               name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc func keyboardDidChangeVisible(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let view = containerView else { return }

        var options: UIView.AnimationOptions = []
        if let animationCurve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt {
            options = UIView.AnimationOptions(rawValue: animationCurve)
            options.update(with: .layoutSubviews)
        }
        
        let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.0
        let endFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? CGRect.zero
        
        let keyboardHeight = endFrame.size.height - bottomInset
        maxKeyboardHeight = endFrame.origin.y >= UIScreen.main.bounds.size.height ? 0.0 : keyboardHeight
        
        constant = maxKeyboardHeight
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            view.layoutIfNeeded()
        }, completion: nil)
    }
    
}
