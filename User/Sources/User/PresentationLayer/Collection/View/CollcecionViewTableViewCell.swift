//
//  CollcecionViewTableViewCell.swift
//  
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import UIKit
import CDUIKit

final class CollcecionViewTableViewCell: UITableViewCell {

  private lazy var backDataView: UIView = {
    let view = GradientView()
    let topColor = UIColor.ds(.mainBackground).withAlphaComponent(0.0).cgColor
    let mediumColor = UIColor.ds(.mainBackground).withAlphaComponent(0.7).cgColor
    let bottomColor = UIColor.ds(.mainBackground).cgColor
    (view.layer as? CAGradientLayer)?.colors = [topColor, mediumColor, bottomColor]
    (view.layer as? CAGradientLayer)?.locations = [0.0, 0.5, 1.0]
    return view
  }()

  private lazy var iconImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .ds(.mainBackground)
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  private lazy var label: UILabel = {
    let label = UILabel()
    label.textColor = .ds(.text)
    label.textAlignment = .left
    label.numberOfLines = 0
    label.font = UIFont.boldSystemFont(ofSize: 25)
    return label
  }()

  private lazy var authorLabel: UILabel = {
    let label = PaddingLabel()
    label.font = .boldSystemFont(ofSize: 15.0)
    label.textColor = .ds(.text)
    label.backgroundColor = .ds(.mainBackground2).withAlphaComponent(0.5)
    label.layer.cornerRadius = 5.0
    label.clipsToBounds = true
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func set(_ model: CollectionPlace) {
    iconImageView.setImage(url: model.image)
    label.text = model.title
    authorLabel.text = model.autor
  }

  private func setupUI() {
    backgroundColor = .clear
    contentView.addSubview(iconImageView)
    iconImageView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.top.bottom.equalToSuperview().inset(20.0)
      $0.height.equalTo(200)
    }
    iconImageView.addSubview(backDataView)
    backDataView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }

    backDataView.addSubview(label)
    backDataView.addSubview(authorLabel)

    label.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalToSuperview().inset(-16)
    }
    authorLabel.snp.makeConstraints {
      $0.bottom.equalTo(label.snp.top).inset(-16.0)
      $0.leading.equalToSuperview()
    }
  }
}
