//
//  MyPlaceViewController.swift
//  
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Foundation
import CDUIKit
import UIKit
import CDFoundation

final class MyPlaceViewController: UIViewController {

  private lazy var tableView: UITableView = {
    let tableview = UITableView(frame: .zero, style: .insetGrouped)
    tableview.dataSource = self
    tableview.delegate = self
    tableview.rowHeight = UITableView.automaticDimension
    tableview.register(HeaderCell.self)
    tableview.backgroundColor = .clear
    return tableview
  }()

  private let vc: UIViewController

  init(vc: UIViewController) {
    self.vc = vc
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  private func setupUI() {
    view.addSubview(tableView)
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}

extension MyPlaceViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = "Красивая аллея"
    cell.textLabel?.textColor = .white
    cell.backgroundColor = .black.withAlphaComponent(0.3)
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    navigationController?.pushViewController(self.vc, animated: true)
  }
}
