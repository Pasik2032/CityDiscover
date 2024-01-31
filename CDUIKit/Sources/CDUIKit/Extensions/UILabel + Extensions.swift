//
//  UILabel + Extensions.swift
//
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

import UIKit

public extension UILabel {
  var fontSize: CGFloat {
    get { font.pointSize }
    set { font = font.withSize(newValue) }
  }
}
