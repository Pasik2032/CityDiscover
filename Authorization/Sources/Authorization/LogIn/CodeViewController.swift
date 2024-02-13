//
//  CodeViewController.swift
//
//
//  Created by Даниил Пасилецкий on 13.02.2024.
//

import UIKit
import CDUIKit
import SnapKit

final class CodeViewController: UIViewController {

  private var bottom: Constraint?

  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 25.0)
    label.text = "Введите код"
    label.textColor = .ds(.text)
    label.numberOfLines = 0
    return label
  }()

  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15.0)
    label.text = "Вам на email был отправлен код, введите его сюда пожалуйста!"
    label.textColor = .ds(.text)
    label.numberOfLines = 0
    return label
  }()

  private lazy var codeField: SWCodeField = {
    let codeField = SWCodeField(blocks: 2, elementsInBlock: 3)
    codeField.lineColor = .ds(.button)
    return codeField
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
    keyboardObserver()
    codeField.startInput()
  }

  private func configUI() {
    view.backgroundColor = .ds(.mainBackground)
    view.layer.cornerRadius = 15.0
    view.addSubviews([
      codeField,
      label,
      descriptionLabel,
    ])

    label.snp.makeConstraints {
      $0.top.equalToSuperview().inset(30.0)
      $0.leading.trailing.equalToSuperview().inset(16.0)
    }

    descriptionLabel.snp.makeConstraints {
      $0.top.equalTo(label.snp.bottom).inset(-16.0)
      $0.leading.trailing.equalToSuperview().inset(16.0)
    }

    codeField.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(descriptionLabel.snp.bottom).inset(-30.0)
      $0.leadingMargin.trailingMargin.equalTo(40)
      $0.height.equalTo(40.0)
      bottom = $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(30.0).constraint
    }
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
}
