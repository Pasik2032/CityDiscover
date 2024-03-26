//
//  ProfileViewController.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 25.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ProfileViewInput: AnyObject {

}

protocol ProfileViewOutput: AnyObject {
  func viewDidLoad()
  var sections: [ProfileSections] { get }
  func actionDidPressed(_ action: ProfileSections.Action)
}


final class ProfileViewController: UIViewController {

  // MARK: - UI

  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.backgroundColor = .clear
    return tableView
  }()

  // MARK: - Properties

  var presenter: ProfileViewOutput?

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
    setupUI()
  }

  // MARK: - Actions


  // MARK: - Setup

  private func setupUI() {
    title = "Профиль"

    view.addSubview(tableView)

    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}

// MARK: - TroikaServiceViewInput

extension ProfileViewController: ProfileViewInput {

}

extension ProfileViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let section = presenter?.sections[section] else { return 0 }
    return switch section {
    case .info: 1
    case .action(let actions): actions.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let section = presenter?.sections[indexPath.section] else { return UITableViewCell() }
    switch section {
    case .info: return UITableViewCell()
    case .action(let actions):
      let cell = UITableViewCell()
      cell.textLabel?.text = actions[indexPath.row].title
      return cell
    }
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    presenter?.sections.count ?? 0
  }
}

extension ProfileViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let section = presenter?.sections[indexPath.section] else { return }
    switch section {
    case .action(let actions):
      presenter?.actionDidPressed(actions[indexPath.row])
    default: break
    }
  }
}
