//
//  String.swift
//  Post
//
//  Created by Leonardo Mendez on 4/7/21.
//

import Foundation

extension String {
    
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
    
}
