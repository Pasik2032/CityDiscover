//
//  AllUserViewController.swift
//
//
//  Created by Даниил Пасилецкий on 26.03.2024.
//

import UIKit

public final class AllUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  let users = ["Eva", "Renata"]

  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    2
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = users[indexPath.row]
    cell.backgroundColor = .ds(.mainBackground2)
    cell.selectionStyle = .none
    return cell
  }

  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let map = MapViewController()
    self.navigationController?.pushViewController(map, animated: true)
  }

  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.backgroundColor = .clear
    return tableView
  }()

  public override func viewDidLoad() {
    super.viewDidLoad()
    title = "Подборки"
    setupUI()
    view.backgroundColor = .ds(.mainBackground)
  }

  private func setupUI() {
    view.addSubview(tableView)
    tableView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.top.equalTo(self.view.safeAreaLayoutGuide)
      $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(16.0)
    }
  }
}
