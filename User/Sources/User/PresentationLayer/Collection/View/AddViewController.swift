//
//  AddViewController.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import CDUIKit
import UIKit

final class AddViewController: ViewController {

  private lazy var tableView: UITableView = {
    let tableview = UITableView(frame: .zero, style: .insetGrouped)
    tableview.dataSource = self
    tableview.delegate = self
    tableview.rowHeight = UITableView.automaticDimension
    tableview.backgroundColor = .clear
    return tableview
  }()

  var output: UpDate?

  lazy var searchBar: UISearchBar = UISearchBar()

  private let person: [String] = []

  private var filter: [String] = []

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

    searchBar.searchBarStyle = UISearchBar.Style.default
    searchBar.placeholder = " Поиск..."
    searchBar.sizeToFit()
    searchBar.isTranslucent = false
    searchBar.backgroundImage = UIImage()
    searchBar.delegate = self
    navigationItem.titleView = searchBar

    view.backgroundColor = .ds(.mainBackground)
  }
}

extension AddViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

  func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
    let a = person.filter { $0.range(of: textSearched, options: .caseInsensitive) != nil }
    filter = a.isEmpty ? person : a
    tableView.reloadData()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    filter.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    let text = filter[indexPath.row]
    cell.textLabel?.text = text
    cell.textLabel?.textColor = .white
    cell.imageView?.tintColor = .white
    cell.backgroundColor = .black.withAlphaComponent(0.3)
    cell.imageView?.image = UIImage(systemName: "person.fill.badge.plus")
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.dismiss(animated: true) {
      self.output?.update()
    }
  }
}

