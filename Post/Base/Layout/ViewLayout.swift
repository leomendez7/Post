//
//  ViewLayout.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit

extension UIView {
    
    public enum BaseViewContentMode {
        case fill
        case fillWidth
        case fillHeight
        case top
        case bottom
        case center
        case left
        case right
    }
    
    public func insertSubview(_ view: UIView, atIndex index: NSInteger,
                              contentMode: BaseViewContentMode, keyboardAware: Bool = false) {
        insertSubview(view, at: index)
        setLayoutContraints(view, contentMode: contentMode, keyboardAware: keyboardAware)
    }
    
    public func addSubview(_ view: UIView, contentMode: BaseViewContentMode, keyboardAware: Bool = false) {
        addSubview(view)
        setLayoutContraints(view, contentMode: contentMode, keyboardAware: keyboardAware)
    }
    
    public func insertSubview(_ view: UIView, at index: Int,
                              contentMode: BaseViewContentMode, keyboardAware: Bool = false) {
        insertSubview(view, at: index)
        setLayoutContraints(view, contentMode: contentMode, keyboardAware: keyboardAware)
    }

    public func insertSubview(_ view: UIView, belowSubview siblingSubview: UIView,
                              contentMode: BaseViewContentMode, keyboardAware: Bool = false) {
        insertSubview(view, belowSubview: siblingSubview)
        setLayoutContraints(view, contentMode: contentMode, keyboardAware: keyboardAware)
    }
    
    public func insertSubview(_ view: UIView, aboveSubview siblingSubview: UIView,
                              contentMode: BaseViewContentMode, keyboardAware: Bool = false) {
        insertSubview(view, aboveSubview: siblingSubview)
        setLayoutContraints(view, contentMode: contentMode, keyboardAware: keyboardAware)
    }
    
    public func setLayoutContraints(_ view: UIView, contentMode: BaseViewContentMode, keyboardAware: Bool = false) {
        view.translatesAutoresizingMaskIntoConstraints = false
        let views = ["view": view]
        let metrics: [String: CGFloat] = ["width": view.frame.width, "height": view.frame.height]
        guard let (horizontal, vertical) = visualFormatForContentMode(contentMode) else { return }
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: horizontal,
                                                                   options: .alignAllCenterX,
                                                                   metrics: metrics,
                                                                   views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: vertical,
                                                                 options: .alignAllCenterY,
                                                                 metrics: metrics,
                                                                 views: views)
        NSLayoutConstraint.activate(horizontalConstraints + verticalConstraints)
        if contentMode == .center {
            addCenterConstraints(view)
        }
        if keyboardAware {
            addVerticalConstraints(view)
        }
    }
    
    public func addCenterConstraints(_ view: UIView) {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal,
                               toItem: view.superview, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal,
                               toItem: view.superview, attribute: .centerY, multiplier: 1.0, constant: 0.0)
            ]
        )
    }
    
    public func addVerticalConstraints(_ view: UIView) {
        guard let superview = view.superview else { return }
        view.topAnchor.constraint(equalToSystemSpacingBelow: superview.topAnchor, multiplier: 0).isActive = true
        KeyboardAwareConstraint(item: superview, attribute: .bottom, relatedBy: .equal,
                                toItem: view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    
    public func visualFormatForContentMode(_ contentMode: BaseViewContentMode) -> (String, String)? {
        switch contentMode {
        case .fill: return ("H:|[view]|", "V:|[view]|")
        case .fillWidth: return ("H:|[view]|", "V:[view]")
        case .fillHeight: return ("H:|[view]|", "V:|[view]")
        case .top: return ("H:[view(width)]", "V:|[view(height)]")
        case .bottom: return ("H:[view(width)]", "V:[view(height)]|")
        case .center: return ("H:[view(width)]", "V:[view(height)]")
        case .left: return ("H:|[view(width)]", "V:[view(height)]")
        case .right: return ("H:[view(width)]|", "V:[view(height)]")
        }
    }
    
    public func constraint(withAttribute attribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        return constraints.first { (constraint) -> Bool in
            return ((constraint.firstItem as? UIView) == self && constraint.firstAttribute == attribute) ||
                ((constraint.secondItem as? UIView) == self && constraint.secondAttribute == attribute)
        }
    }
    
    public var keyboardAwareConstraints: [KeyboardAwareConstraint] {
        return constraints.compactMap { (constraint) -> KeyboardAwareConstraint? in
            return constraint as? KeyboardAwareConstraint
        }
    }
    
}
