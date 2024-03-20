//
//  SurveyUserNameTableViewCell.swift
//
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//


import CDUIKit
import UIKit

final class SurveyUserNameTableViewCell: UITableViewCell {

  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 15.0)
    label.text = "Введите имя пользовтаеля"
    label.textColor = .ds(.text)
    label.numberOfLines = 0
    return label
  }()

  private lazy var textField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "UserName"
    textField.backgroundColor = UIColor.ds(.mainBackground2)
    textField.layer.cornerRadius = 5.0
    textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
    return textField
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func config(text: String?) {
    if let text {
      textField.text = text
      textField.isEnabled = false
    }
  }

  private func setupUI() {
    backgroundColor = .clear
    contentView.addSubviews([label, textField])
    selectionStyle = .none

    label.snp.makeConstraints {
      $0.top.equalToSuperview().inset(8.0)
      $0.leading.trailing.equalToSuperview().inset(16)
    }

    textField.snp.makeConstraints {
      $0.top.equalTo(label.snp.bottom).inset(-10)
      $0.leading.trailing.equalToSuperview().inset(16)
      $0.height.equalTo(30.0)
      $0.bottom.equalToSuperview().inset(8.0)
    }
  }
}

