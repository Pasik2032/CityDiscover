//
//  CodeViewController.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit
import CDUIKit

protocol CodeViewInput: AnyObject {

}

protocol CodeViewOutput: AnyObject {
  func viewDidLoad()
  func codeDidSend(_ code: String)
}


final class CodeViewController: UIViewController {

  // MARK: - UI

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
    label.text = "Вам на \(emailText) был отправлен код, введите его сюда пожалуйста!"
    label.textColor = .ds(.text)
    label.numberOfLines = 0
    return label
  }()

  private lazy var codeField: SWCodeField = {
    let codeField = SWCodeField(blocks: 2, elementsInBlock: 3)
    codeField.lineColor = .ds(.button)
    return codeField
  }()


  // MARK: - Properties

  var presenter: CodeViewOutput?
  var emailText: String = "email"

  // MARK: - UIViewController

  override func viewDidLoad() {
    self.navigationItem.backBarButtonItem?.title = "Назад"
    navigationController?.navigationBar.barTintColor = .white
    super.viewDidLoad()
    setupUI()
    configAction()
    codeField.startInput()
    presenter?.viewDidLoad()
  }

  // MARK: - Actions

  private func configAction() {
    codeField.doAfterCodeDidEnter = { code in
      self.presenter?.codeDidSend(code)
    }
  }

  // MARK: - Setup

  private func setupUI() {
    view.backgroundColor = .ds(.mainBackground)
    view.addSubviews([
      codeField,
      label,
      descriptionLabel,
    ])

    label.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
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
    }
  }
}

// MARK: - CodeViewInput

extension CodeViewController: CodeViewInput {

}
