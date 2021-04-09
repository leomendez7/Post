//
//  Array.swift
//  Post
//
//  Created by Leonardo Mendez on 4/9/21.
//

import UIKit

extension Array where Element == UIView {
    
    public var arranged: [UIView] {
        return sorted { (lhs, rhs) -> Bool in
            lhs.absolutePosition.x < rhs.absolutePosition.x
        }.sorted { (lhs, rhs) -> Bool in
            lhs.absolutePosition.y < rhs.absolutePosition.y
        }
    }
    
}

extension UIView {
    
    public var absolutePosition: CGPoint {
        return convert(bounds.origin, to: UIApplication.shared.keyWindow?.rootViewController?.view)
    }
    
    public var isVisible: Bool {
        guard let superview = superview else { return true }
        return !isHidden && superview.isVisible
    }
    
    public func subviews<T>(of type: T.Type) -> [T] {
        var results = [T]()
        subviews.forEach { subview in
            if let textField = subview as? T {
                results.append(textField)
            } else {
                results.append(contentsOf: subview.subviews(of: type))
            }
        }
        return results
    }
    
}
