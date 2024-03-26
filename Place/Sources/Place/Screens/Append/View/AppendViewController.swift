//
//  AppendViewController.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CDUIKit
import CoreLocation
import SnapKit

protocol AppendViewInput: AnyObject {
  func clear()
}

protocol AppendViewOutput: AnyObject, ImageDeleagte, NameDidChange, MapDeleagte {
  func viewDidLoad()
  var sections: [AppendSection] { get }
  func saveDidPressed()
}


public final class AppendViewController: ViewController {

  // MARK: - UI

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.backgroundColor = .clear
    tableView.separatorStyle = .none
    tableView.contentInset = .init(top: 0, left: 0, bottom: 50.0, right: 0)
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(AppendNameTableViewCell.self)
    tableView.register(AppendMapTableViewCell.self)
    tableView.register(AppendImageTableViewCell.self)
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

  var presenter: AppendViewOutput?
  var isClear: Bool = false

  // MARK: - UIViewController

  public override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
    hideKeyboardWhenTappedAround()
    setupUI()
  }

  // MARK: - Actions

  @objc private func buttonDidPressed() {
    presenter?.saveDidPressed()
  }

  // MARK: - Setup

  private func setupUI() {
    view.backgroundColor = .ds(.mainBackground)
    view.addSubview(tableView)
    view.addSubview(button)
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }

    button.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
      $0.height.equalTo(50.0)
    }
  }
}

// MARK: - AppendViewInput

extension AppendViewController: AppendViewInput {
  func clear() {
    tableView.reloadData()
  }
}

extension AppendViewController: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter?.sections.count ?? 0
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let section = presenter?.sections[indexPath.row] else { return UITableViewCell() }
    switch section {
    case .name:
      let cell: AppendNameTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      cell.output = presenter
      cell.clear()
      return cell
    case .location:
      let cell: AppendMapTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      cell.delegate = presenter
      return cell
    case .image:
      let cell: AppendImageTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      cell.delegate = presenter
      cell.clear()
      return cell
    }
  }
}
