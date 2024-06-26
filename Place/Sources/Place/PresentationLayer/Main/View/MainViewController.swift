//
//  MainViewController.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 22.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

protocol MainViewInput: AnyObject {
  func setItem(models: [CardsDataModel])
}

protocol MainViewOutput: AnyObject, StackContainerDelegate {
  func viewDidLoad()
  func mapDidSelected()
}


final class MainViewController: UIViewController {

  private var viewModelData: [CardsDataModel] = []

  // MARK: - UI

  private lazy var stackContainer: StackContainerView = {
    let stackContainer = StackContainerView()
    stackContainer.dataSource = self
    stackContainer.delegate = presenter
    stackContainer.alpha = 0
    return stackContainer
  }()


  // MARK: - Properties

  var presenter: MainViewOutput?

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
    setupUI()
    title = "Интересные места"
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if stackContainer.alpha == 0 {
      stackContainer.reloadData()

      UIView.animate(withDuration: 0.25) {
        self.stackContainer.alpha = 1
      }
    }
  }

  // MARK: - Actions

  @objc private func mapDidSelected() {
    presenter?.mapDidSelected()
  }

  // MARK: - Setup

  private func setupUI() {
    setupNavBar()
    view.addSubview(stackContainer)

    stackContainer.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(16.0)
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(32.0)
    }
  }

  private func setupNavBar() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(
      image: UIImage(systemName: "map"),
      style: .plain,
      target: self,
      action: #selector(mapDidSelected)
    )
  }
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {
  func setItem(models: [CardsDataModel]) {
    viewModelData = models
    stackContainer.reloadData()
  }
}

// MARK: - SwipeCardsDataSource

extension MainViewController: SwipeCardsDataSource {
  func numberOfCardsToShow() -> Int {
    return viewModelData.count
  }

  func card(at index: Int) -> SwipeCardView {
    let card = SwipeCardView()
    card.dataSource = viewModelData[index]
    return card
  }

  func emptyView() -> UIView? {
    return nil
  }
}
