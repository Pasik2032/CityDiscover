//
//  SurveyTitleTableViewCell.swift
//  
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//

import CDUIKit
import UIKit

final class SurveyTitleTableViewCell: UITableViewCell {

  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 25.0)
    label.text = "Данные профиля"
    label.textColor = .ds(.text)
    label.numberOfLines = 0
    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15.0)
    label.text = "Это поможет выдовать вам более точные рекомендации"
    label.textColor = .ds(.text)
    label.numberOfLines = 0
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
    backgroundColor = .clear
    addSubviews([label, descriptionLabel])

    label.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.trailing.equalToSuperview().inset(16)
    }

    descriptionLabel.snp.makeConstraints {
      $0.top.equalTo(label.snp.bottom).inset(-16)
      $0.leading.trailing.equalToSuperview().inset(16)
      $0.bottom.equalToSuperview().inset(8.0)
    }
  }
}
