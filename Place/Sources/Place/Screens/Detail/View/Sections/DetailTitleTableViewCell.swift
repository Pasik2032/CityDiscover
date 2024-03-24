//
//  DetailTitleTableViewCell.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import CDUIKit
import UIKit
import MapKit

final class DetailTitleTableViewCell: UITableViewCell {

  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 25.0)
    label.textColor = .ds(.text)
    label.numberOfLines = 0
    return label
  }()

  private lazy var categotyLabel: UILabel = {
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

  private func setupUI() {
    selectionStyle = .none
    backgroundColor = .clear
    contentView.addSubviews([label, categotyLabel])
    label.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.top.equalToSuperview().inset(8.0)
    }

    categotyLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().inset(16.0)
      $0.top.equalTo(label.snp.bottom).inset(-8.0)
      $0.bottom.equalToSuperview().inset(8.0)
    }
  }

  func setup(title: String, category: String) {
    label.text = title
    categotyLabel.text = category
  }
}
