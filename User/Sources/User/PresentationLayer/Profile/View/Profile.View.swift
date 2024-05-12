//
//  Profile.View.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 14.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CDUIKit

protocol ProfileViewInput: AnyObject {
  func setItem(sections: [Profile.Section]) 
}

protocol ProfileViewOutput: AnyObject {
  func viewDidLoad()
  func itemDidSelected(item: Profile.Item)
}

extension Profile {
  final class View: ViewController {

    // MARK: - UI

    private lazy var tableView: UITableView = {
      let tableview = UITableView(frame: .zero, style: .insetGrouped)
      tableview.dataSource = self
      tableview.delegate = self
      tableview.rowHeight = UITableView.automaticDimension
      tableview.register(HeaderCell.self)
      tableview.backgroundColor = .clear
      return tableview
    }()

    // MARK: - Properties

    var presenter: ProfileViewOutput?

    private var sections: [Section] = []

    // MARK: - UIViewController

    override func viewDidLoad() {
      super.viewDidLoad()
      presenter?.viewDidLoad()
      setupUI()
    }

    // MARK: - Actions


    // MARK: - Setup

    private func setupUI() {
      view.backgroundColor = .ds(.mainBackground)

      view.addSubview(tableView)

      tableView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
  }
}

// MARK: - AppendViewInput

extension Profile.View: ProfileViewInput {
  func setItem(sections: [Profile.Section]) {
    self.sections = sections
    tableView.reloadData()
  }
}

extension Profile.View: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    sections.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch sections[section] {
    case .exitAction(let items), .places(let items): return items.count
    case .header: return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch sections[indexPath.section] {
    case .exitAction(let items), .places(let items):
      let model = items[indexPath.row]
      let cell = UITableViewCell()
      cell.textLabel?.text = model.title
      cell.textLabel?.textColor = model.color
      cell.imageView?.image = UIImage(systemName: model.icon)
      cell.imageView?.tintColor = model.color
      cell.backgroundColor = .black.withAlphaComponent(0.3)
      return cell
    case .header:
      let cell: HeaderCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      return cell
    }

  }
}

extension Profile.View: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch sections[indexPath.section] {
    case .exitAction(let items), .places(let items):
      presenter?.itemDidSelected(item: items[indexPath.row])
    case .header: break
    }
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
