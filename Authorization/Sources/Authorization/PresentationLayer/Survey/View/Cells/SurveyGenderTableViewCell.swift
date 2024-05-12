//
//  SurveyGenderTableViewCell.swift
//
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//

import CDUIKit
import UIKit

protocol SurveyGenderOutput: AnyObject {
  func genderDidChange(new: User.Gender)
}

final class SurveyGenderTableViewCell: UITableViewCell {

  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 15.0)
    label.text = "Укажите ваш пол:"
    label.textColor = .ds(.text)
    label.numberOfLines = 0
    return label
  }()

  private lazy var man: RadioButton = {
    let man = RadioButton()
    man.setTitle("Мужской", for: .normal)
    man.layer.borderWidth = 1.0
    man.layer.cornerRadius = 15.0
    man.setTitleColor(.ds(.text), for: .normal)
    man.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    return man
  }()

  private lazy var woman: RadioButton = {
    let woman = RadioButton()
    woman.setTitle("Женский", for: .normal)
    woman.layer.borderWidth = 1.0
    woman.layer.cornerRadius = 15.0
    woman.setTitleColor(.ds(.text), for: .normal)
    return woman
  }()

  private lazy var stack: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [man, woman])
    stack.axis = .horizontal
    stack.distribution = .fillEqually
    stack.alignment = .center
    stack.spacing = 50.0
    return stack
  }()

  weak var output: SurveyGenderOutput?

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func config(gender: User.Gender?) {
    if let gender {
      switch gender {
      case .female:
        woman.isSelected = true
        man.isSelected = false
      case .male:
        woman.isSelected = false
        man.isSelected = true
      }

      man.isEnabled = false
      woman.isEnabled = false
    }
  }

  private func setupUI() {
    woman.alternateButton = [man]
    man.alternateButton = [woman]

    contentView.addSubviews([label, stack])
    selectionStyle = .none
    backgroundColor = .clear

    label.snp.makeConstraints {
      $0.top.equalToSuperview().inset(8.0)
      $0.leading.trailing.equalToSuperview().inset(16)
    }

    stack.snp.makeConstraints {
      $0.top.equalTo(label.snp.bottom).inset(-10)
      $0.leading.trailing.equalToSuperview().inset(16)
      $0.bottom.equalToSuperview().inset(8.0)
    }

    man.snp.makeConstraints {
      $0.height.equalTo(30.0)
      $0.width.equalTo(100.0)
    }

    woman.snp.makeConstraints {
      $0.height.equalTo(30.0)
      $0.width.equalTo(100.0)
    }
  }

  @objc private func buttonPressed() {
    if man.isSelected { output?.genderDidChange(new: .male) }
    if woman.isSelected { output?.genderDidChange(new: .female) }
  }
}
