//
//  ColorScheme.swift
//  Post
//
//  Created by Leonardo Mendez on 4/6/21.
//

import UIKit

public typealias TextViewColors = (background: UIColor, text: UIColor)
public typealias SwitchColors = (on: UIColor, off: UIColor)

public enum ColorScheme {
    
    public static let launchBackground: UIColor = UIColor(named: "LaunchBackground") ?? .clear
    public static let launchBackgroundWithAlpha: UIColor = UIColor(named: "LaunchBackgroundWithAlpha") ?? .clear
    public static let action: UIColor = UIColor(named: "Action") ?? .clear
    public static let placeholder: UIColor = UIColor(named: "Placeholder") ?? .clear
    public static let destructiveBackground: UIColor = UIColor(named: "DestructiveBackground") ?? .clear
    public static let destructive: UIColor = UIColor(named: "Destructive") ?? .clear
    public static let success: UIColor = UIColor(named: "Success") ?? .clear
    public static let shadow: UIColor = UIColor(named: "Shadow") ?? .clear
    public static let ligthGrayView: UIColor = UIColor(named: "LigthGrayView") ?? .clear
    public static let lightGray: UIColor = UIColor(named: "LightGray") ?? .clear
    public static let linkBlue: UIColor = UIColor(named: "LinkBlue") ?? .clear
    
}
