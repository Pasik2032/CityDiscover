//
//  UITableView+Register.swift
//
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//

import UIKit

public extension UITableView {
  func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
    register(T.self, forCellReuseIdentifier: T.defaultReusableId)
  }

  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
    guard let cell = dequeueReusableCell(withIdentifier: T.defaultReusableId, for: indexPath) as? T else {
      fatalError("Ошибка")
    }
    return cell
  }
}

