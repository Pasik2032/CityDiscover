//
//  EmailViewController.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CDUIKit
import SnapKit

protocol EmailViewInput: AnyObject {

}

protocol EmailViewOutput: AnyObject {
  func viewDidLoad()
  func emailNextDidPressed(email: String)
}


final class EmailViewController: ViewController {

  // MARK: - UI

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

  // MARK: - Properties

  var presenter: EmailViewOutput?
  private var bottom: Constraint?

  // MARK: - UIViewController

  override func viewDidLoad() {
    self.navigationItem.backBarButtonItem?.title = "Назад"
    navigationController?.navigationBar.barTintColor = .white
    super.viewDidLoad()
    hideKeyboardWhenTappedAround()
    setupUI()
    presenter?.viewDidLoad()
  }

  // MARK: - Actions

  @objc private func buttonDidPressed() {
    guard textField.validate(), let text = textField.text else { return }
    presenter?.emailNextDidPressed(email: text)
  }

  // MARK: - Setup

  private func setupUI() {
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
      $0.top.equalTo(descriptionLabel.snp.bottom).inset(-30.0)
    }

    titleLabel.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.leading.trailing.equalToSuperview().inset(16.0)
    }

    descriptionLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).inset(-16.0)
      $0.leading.trailing.equalToSuperview().inset(16.0)
    }
  }

  // MARK: - Keyboard

  override func keyboardWillShow(height: CGFloat) {
    bottom?.update(inset: height)
    view.layoutIfNeeded()
  }

  override func keyboardWillHidden() {
    bottom?.update(inset: 30.0)
    view.layoutIfNeeded()
  }
}

// MARK: - EmailViewInput

extension EmailViewController: EmailViewInput {

}
