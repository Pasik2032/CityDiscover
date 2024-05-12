//
//  AppendImageTableViewCell.swift
//  
//
//  Created by Даниил Пасилецкий on 26.03.2024.
//


import UIKit

protocol ImageDeleagte: AnyObject {
  func imageDidChange(_ image: [UIImage])
}

final class AppendImageTableViewCell: UITableViewCell {

  weak var delegate: ImageDeleagte?

  enum Item {
    case add
    case image(UIImage)
  }

  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 15.0)
    label.text = "Добавление фото"
    return label
  }()

  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .clear
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.showsVerticalScrollIndicator = false
    collectionView.contentInset = .init(top: .zero, left: 16.0, bottom: .zero, right: 16.0)
    collectionView.register(ImageCollectionViewCell.self)
    collectionView.register(AddImageCollectionViewCell.self)
    return collectionView
  }()

  private var items: [Item] = [.add]

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    backgroundColor = .clear
    contentView.addSubview(label)
    
    contentView.addSubview(collectionView)
    label.snp.makeConstraints {
      $0.top.equalToSuperview().inset(32.0)
      $0.leading.trailing.equalToSuperview().inset(16.0)
    }

    collectionView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(150.0)
      $0.top.equalTo(label.snp.bottom).inset(-10.0)
      $0.bottom.equalToSuperview().inset(8.0)
    }
  }
}

extension AppendImageTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch items[indexPath.row] {
    case .add:
      let cell: AddImageCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
      let guest = UITapGestureRecognizer(target: self, action: #selector(pickerImage))
      cell.addGestureRecognizer(guest)
      return cell
    case .image(let image):
      let cell: ImageCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
      cell.setup(image: image)
      return cell
    }
  }

  func clear() {
    items = [.add]
    collectionView.reloadData()
  }

  @objc private func pickerImage() {
    ImagePickerManager().pickImage() { image in
      self.items.append(.image(image))
      self.collectionView.reloadData()
      let images: [UIImage] = self.items.compactMap {
        guard case .image(let image) = $0 else { return nil }
        return image
      }
      self.delegate?.imageDidChange(images)
    }
  }
}
