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

  func setup(image: UIImage) {
    imageView.image = image
    let ratio = image.size.width / image.size.height
    self.layoutIfNeeded()
    let newWidth = 150.0 * ratio
    self.imageView.snp.updateConstraints { make in
      make.width.equalTo(newWidth)
      make.height.equalTo(150.0)
      make.edges.equalToSuperview()
    }
    self.invalidateIntrinsicContentSize()
    self.layoutIfNeeded()
  }

  func setup(image: String) {
    imageView.setImage(url: image) { image in
      guard let image else { return }
      let ratio = image.size.width / image.size.height
      self.layoutIfNeeded()
      let newWidth = 150.0 * ratio
      self.imageView.snp.updateConstraints { make in
        make.width.equalTo(newWidth)
        make.height.equalTo(150.0)
        make.edges.equalToSuperview()
      }
      self.invalidateIntrinsicContentSize()
      self.layoutIfNeeded()
    }
  }

  private func setupUI() {
    self.layer.cornerRadius = 15.0
    contentView.addSubview(imageView)
  }
}
