//
//  ReusableView.swift
//  
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//

import UIKit

public protocol ReusableView: AnyObject {
  static var defaultReusableId: String { get }
}

public extension ReusableView where Self: UIView {
  static var defaultReusableId: String {
    NSStringFromClass(self)
  }
}

extension UITableViewCell: ReusableView {}
extension UICollectionViewCell: ReusableView {}
