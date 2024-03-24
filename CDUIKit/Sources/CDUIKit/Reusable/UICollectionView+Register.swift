//
//  UICollectionView+Register.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import UIKit

public extension UICollectionView {
  func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView {
    register(T.self, forCellWithReuseIdentifier: T.defaultReusableId)
  }

  func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReusableId, for: indexPath) as? T else {
      fatalError("Ошибка")
    }
    return cell
  }
}
