//
//  AppendNameTableViewCell.swift
//
//
//  Created by Даниил Пасилецкий on 26.03.2024.
//

import UIKit

protocol NameDidChange: AnyObject {
  func nameDidPressed(name: String?, description: String?)
}

final class AppendNameTableViewCell: UITableViewCell {

  private lazy var label: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = .boldSystemFont(ofSize: 20.0)
    label.text = "Добавление место"
    return label
  }()

  private lazy var textView: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.placeholder = "Название место"
    textField.font = .boldSystemFont(ofSize: 25.0)
    textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    return textField
  }()

  private lazy var descriptionTextView: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = .clear
    textField.placeholder = "Описание"
    textField.font = .systemFont(ofSize: 15.0)
    textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    return textField
  }()

  weak var output: NameDidChange?

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
    contentView.addSubview(textView)
    contentView.addSubview(descriptionTextView)
    label.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.trailing.equalToSuperview().inset(16.0)
    }

    textView.snp.makeConstraints {
      $0.top.equalTo(label.snp.bottom).inset(-16.0)
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.height.equalTo(30.0)
    }

    descriptionTextView.snp.makeConstraints {
      $0.top.equalTo(textView.snp.bottom).inset(-16.0)
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.height.equalTo(30.0)
      $0.bottom.equalToSuperview()
    }
  }

  func clear() {
    textView.text = nil
    descriptionTextView.text = nil
  }

  @objc private func textFieldDidChange() {
    output?.nameDidPressed(name: textView.text, description: descriptionTextView.text)
  }
}
