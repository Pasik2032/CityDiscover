//
//  UIView + Extensios.swift
//
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

import UIKit

public extension UIView {
  func addSubviews(_ views: [UIView]) {
    views.forEach(addSubview)
  }
}
