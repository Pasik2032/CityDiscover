//
//  ImageView+Kf.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import Kingfisher
import UIKit

public extension UIImageView {
  func setImage(url: String) {
    guard let url = URL(string: url) else { return }
    kf.setImage(with: url)
  }

  func setImage(url: String, completion: @escaping (UIImage?) -> Void) {
    guard let url = URL(string: url) else { return }
    kf.setImage(with: url) { result in
      let image = try? result.get()
      completion(image?.image)
    }
  }
}
