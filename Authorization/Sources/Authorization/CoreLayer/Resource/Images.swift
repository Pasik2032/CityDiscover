//
//  Images.swift
//  
//
//  Created by Даниил Пасилецкий on 03.03.2024.
//

import UIKit

enum Image: String {
  case city1
  case city2
  case city3
}

extension UIImage {
  convenience init?(_ image: Image) {
    self.init(named: image.rawValue, in: .module, compatibleWith: nil)
  }
}
