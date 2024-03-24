//
//  DetailViewController.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 24.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CDUIKit

protocol DetailViewInput: AnyObject {
  func update()
}

protocol DetailViewOutput: AnyObject, DetailDataDelegate {
  func viewDidLoad()
  var section: [DetailSection] { get }
}


final class DetailViewController: UIViewController {

  // MARK: - UI

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.backgroundColor = .clear
    tableView.separatorStyle = .none
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(DetailMapTableViewCell.self)
    tableView.register(DetailTitleTableViewCell.self)
    tableView.register(DetailImageTableViewCell.self)
    tableView.register(DetailDescriptionTableViewCell.self)
    tableView.register(DetailDataTableViewCell.self)
    tableView.register(DetailStarTableViewCell.self)
    return tableView
  }()

  // MARK: - Properties

  var presenter: DetailViewOutput?

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

// MARK: - DetailViewInput

extension DetailViewController: DetailViewInput {
  func update() {
    tableView.reloadData()
  }
}

extension DetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter?.section.count ?? .zero
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let section = presenter?.section[indexPath.row] else { return UITableViewCell() }
    switch section {
    case .map(let coordinate):
      let cell: DetailMapTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      cell.setup(coordinate: coordinate)
      return cell
    case .title(let title, let category):
      let cell: DetailTitleTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      cell.setup(title: title, category: category)
      return cell
    case .image(let images):
      let cell: DetailImageTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      cell.setup(images: images)
      return cell
    case .description(let description):
      let cell: DetailDescriptionTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      cell.setup(description: description)
      return cell
    case .data(let rating, let counter):
      let cell: DetailDataTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      cell.setup(rating: rating, counter: counter)
      cell.output = presenter
      return cell
    case .star(let mark):
      let cell: DetailStarTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
      cell.setup(mark: mark)
      return cell
    }
  }
}
