//
//  DetailImageTableViewCell.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import CDUIKit
import UIKit
import MapKit

final class DetailImageTableViewCell: UITableViewCell {

  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.backgroundColor = .clear
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.showsVerticalScrollIndicator = false
    collectionView.contentInset = .init(top: .zero, left: 16.0, bottom: .zero, right: 16.0)
    collectionView.register(ImageCollectionViewCell.self)
    return collectionView
  }()

  private var images: [String] = []

  private var images2: [UIImage] = []

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    selectionStyle = .none
    backgroundColor = .clear
    contentView.addSubview(collectionView)
    collectionView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(150.0)
      $0.top.bottom.equalToSuperview().inset(8.0)
    }
  }

  func setup(images: [String]) {
    self.images = images
    collectionView.reloadData()
  }

  func setup(images: [UIImage]) {
    self.images2 = images
    collectionView.reloadData()
  }
}

extension DetailImageTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    images.count == 0 ? images2.count : images.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: ImageCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
    if images.count != 0 {
      cell.setup(image: images[indexPath.row])
    } else {
      cell.setup(image: images2[indexPath.row])
    }
    return cell
  }
}
