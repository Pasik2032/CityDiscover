//
//  DetailStarTableViewCell.swift
//
//
//  Created by Даниил Пасилецкий on 25.03.2024.
//

import UIKit

final class DetailStarTableViewCell: UITableViewCell {

  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 18.0)
    label.textColor = .ds(.text)
    label.text = "Уже были здесь?\nОцените место"
    label.textAlignment = .center
    label.numberOfLines = 0
    return label
  }()

  private lazy var backView: UIView = {
    let view = UIView()
    view.backgroundColor = .ds(.mainBackground2)
    view.layer.cornerRadius = 15.0
    return view
  }()

  private lazy var starStackView: StarStackView = {
    let starStackView = StarStackView()
    return starStackView
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
    contentView.addSubview(backView)
    backView.addSubviews([label, starStackView])

    backView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.top.bottom.equalToSuperview().inset(8.0)
    }

    label.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.top.equalToSuperview().inset(8.0)
    }

    starStackView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalToSuperview().inset(8.0)
      $0.top.equalTo(label.snp.bottom).inset(-8.0)
    }
  }

  func setup(mark: Int?) {
  }
}

