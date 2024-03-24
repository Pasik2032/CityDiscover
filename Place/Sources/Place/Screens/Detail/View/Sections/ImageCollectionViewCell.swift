//
//  ImageCollectionViewCell.swift
//  
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import UIKit
import Networking

final class ImageCollectionViewCell: UICollectionViewCell {

  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = 15.0
    imageView.layer.masksToBounds = true
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setup(image: String) {
    imageView.setImage(url: image)
  }

  private func setupUI() {
    self.layer.cornerRadius = 15.0
    contentView.addSubview(imageView)
    imageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
