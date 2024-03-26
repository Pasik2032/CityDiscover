//
//  AddImageCollectionViewCell.swift
//
//
//  Created by Даниил Пасилецкий on 26.03.2024.
//

import UIKit

final class AddImageCollectionViewCell: UICollectionViewCell {

  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "plus")
    return imageView
  }()

  private lazy var backView: UIView = {
    let backView = UIView()
    backView.layer.cornerRadius = 15.0
    backView.backgroundColor = .ds(.mainBackground2)
    return backView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    contentView.addSubview(backView)
    backView.addSubview(imageView)

    backView.snp.makeConstraints {
      $0.edges.equalToSuperview()
      $0.height.equalTo(150.0)
      $0.width.equalTo(200)
    }

    imageView.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.size.equalTo(30.0)
    }
  }
}
