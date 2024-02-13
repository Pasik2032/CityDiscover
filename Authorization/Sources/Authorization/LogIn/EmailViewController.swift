//
//  EmailViewController.swift
//
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

import UIKit
import CDUIKit
import SnapKit
import SwiftUI

final class EmailViewController: UIViewController {

  private var bottom: Constraint?

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 25.0)
    label.text = "Введите E-mail"
    label.textColor = .ds(.text)
    label.numberOfLines = 0
    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15.0)
    label.text = "Ваш email необходим, что бы мы отправили на него код и потом вы вошли, ну и вообще что бы все было классно!"
    label.textColor = .ds(.text)
    label.numberOfLines = 0
    return label
  }()

  private lazy var textField: LineTextField = {
    let textField = LineTextField(style: .email)
    textField.accentColor = .ds(.button)
    return textField
  }()

  private lazy var button: UIButton = {
    let button = UIButton()
    button.setTitle("Вход", for: .normal)
    button.layer.cornerRadius = 15.0
    button.backgroundColor = .ds(.button)
    button.setTitleColor(.ds(.textButton), for: .normal)
    button.addTarget(self, action: #selector(buttonDidPressed), for: .touchUpInside)
    return button
  }()

  @objc private func buttonDidPressed() {
    guard textField.validate() else { return }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    keyboardObserver()
  }


  private func keyboardObserver() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillDisappear),
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )

    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillAppear),
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )
  }

  @objc func keyboardWillDisappear() {
    bottom?.update(inset: 16.0)
    parent?.view.layoutIfNeeded()
  }

  @objc func keyboardWillAppear(_ notification: Notification) {
    guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
    let keyboarHeight = keyboardFrame.cgRectValue.height
    bottom?.update(inset: keyboarHeight)
    parent?.view.layoutIfNeeded()
  }

  private func configureUI() {
    view.backgroundColor = .ds(.mainBackground)
    view.layer.cornerRadius = 15.0
    view.addSubviews([
      textField,
      button,
      titleLabel,
      descriptionLabel,
    ])

    button.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16.0)
      bottom = $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(16.0).constraint
      $0.height.equalTo(50.0)
    }

    textField.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.bottom.equalTo(button.snp.top).offset(-32.0)
      $0.top.equalTo(descriptionLabel.snp.bottom).inset(-30.0)
    }

    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().inset(30.0)
      $0.leading.trailing.equalToSuperview().inset(16.0)
    }

    descriptionLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).inset(-16.0)
      $0.leading.trailing.equalToSuperview().inset(16.0)
    }
  }
}
