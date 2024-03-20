//
//  SurveyViewController.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CDUIKit
import SnapKit

protocol SurveyViewInput: AnyObject {

}

protocol SurveyViewOutput: AnyObject {
  func viewDidLoad()
  func emailNextDidPressed(email: String)
}


final class SurveyViewController: ViewController {

  // MARK: - UI

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .clear
    tableView.dataSource = self
    tableView.separatorStyle = .none
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(SurveyTitleTableViewCell.self)
    tableView.register(SurveyUserNameTableViewCell.self)
    tableView.register(SurveyAgeTableViewCell.self)
    return tableView
  }()

  private lazy var button: UIButton = {
    let button = UIButton()
    button.setTitle("Сохранить", for: .normal)
    button.layer.cornerRadius = 15.0
    button.backgroundColor = .ds(.button)
    button.setTitleColor(.ds(.textButton), for: .normal)
    button.addTarget(self, action: #selector(buttonDidPressed), for: .touchUpInside)
    return button
  }()

  // MARK: - Properties

  var presenter: SurveyViewOutput?
  private var bottom: Constraint?

  private var sections: [Section] = [.title, .username(nil), .age(nil)]

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
  }

  // MARK: - Setup

  private func setupUI() {
    view.backgroundColor = .ds(.mainBackground)
    view.layer.cornerRadius = 15.0
    view.addSubviews([
      tableView,
      button,
    ])

    button.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16.0)
      bottom = $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(16.0).constraint
      $0.height.equalTo(50.0)
    }

    tableView.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
      $0.leading.trailing.bottom.equalToSuperview()
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

extension SurveyViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    sections.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch sections[indexPath.row] {
    case .title: 
      let cell: SurveyTitleTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      return cell
    case .username(let name):
      let cell: SurveyUserNameTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      cell.config(text: name)
      return cell
    case .age(let age):
      let cell: SurveyAgeTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      cell.config(text: age)
      return cell
    }
  }
}
// MARK: - EmailViewInput

extension SurveyViewController: SurveyViewInput {

}

