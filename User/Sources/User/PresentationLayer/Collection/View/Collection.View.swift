//
//  Collection.View.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CDUIKit

protocol CollectionViewInput: AnyObject {
  func show(places: [CollectionPlace])
}

protocol CollectionViewOutput: AnyObject {
  func viewDidLoad()
  func add()
}

extension Collection {
  final class View: ViewController {

    // MARK: - UI

    private lazy var tableView: UITableView = {
      let tableview = UITableView(frame: .zero, style: .insetGrouped)
      tableview.dataSource = self
      tableview.delegate = self
      tableview.rowHeight = UITableView.automaticDimension
      tableview.backgroundColor = .clear
      tableview.register(CollcecionViewTableViewCell.self)
      return tableview
    }()

    var aa = true

    // MARK: - Properties

    var presenter: CollectionViewOutput?
    var places: [CollectionPlace] = []


    // MARK: - UIViewController

    override func viewDidLoad() {
      super.viewDidLoad()
      presenter?.viewDidLoad()
      setupUI()
      title = "Подборки"
      if aa {
        navigationItem.rightBarButtonItem = .init(
          image: UIImage(systemName: "plus"),
          style: .plain,
          target: self,
          action: #selector(add)
        )
      }
    }

    // MARK: - Actions

    @objc private func add() {
      presenter?.add()
    }

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

extension Collection.View: CollectionViewInput {
  func show(places: [CollectionPlace]) {
    self.places = places
    tableView.reloadData()
  }
}

extension Collection.View: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    places.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: CollcecionViewTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
    cell.set(places[indexPath.row])
    return cell
  }
}

extension Collection.View: UITableViewDelegate {

}
