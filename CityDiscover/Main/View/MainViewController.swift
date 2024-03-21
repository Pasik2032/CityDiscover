//
//  MainViewController.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 22.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MainViewInput: AnyObject {

}

protocol MainViewOutput: AnyObject {
  func viewDidLoad()
}


final class MainViewController: UIViewController {

  var viewModelData = [CardsDataModel(address: "UIColor(red:0.96, green:0.81, blue:0.46, alpha:1.0)", text: "Hamburger", image: "hamburger"),
                       CardsDataModel(address: "UIColor(red:0.96, green:0.81, blue:0.46, alpha:1.0)", text: "Puppy", image: "puppy"),
                       CardsDataModel(address: "UIColor(red:0.96, green:0.81, blue:0.46, alpha:1.0)", text: "Poop", image: "poop"),
                       CardsDataModel(address: "UIColor(red:0.96, green:0.81, blue:0.46, alpha:1.0)", text: "Panda", image: "panda"),
                       CardsDataModel(address: "UIColor(red:0.96, green:0.81, blue:0.46, alpha:1.0)", text: "Subway", image: "subway"),
                       CardsDataModel(address: "UIColor(red:0.96, green:0.81, blue:0.46, alpha:1.0)", text: "Robot", image: "robot")]

  // MARK: - UI

  private lazy var stackContainer: StackContainerView = {
    let stackContainer = StackContainerView()
    stackContainer.dataSource = self
    return stackContainer
  }()


  // MARK: - Properties

  var presenter: MainViewOutput?

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
    setupUI()
    stackContainer.reloadData()
  }

  // MARK: - Actions


  // MARK: - Setup

  private func setupUI() {
    view.addSubview(stackContainer)

    stackContainer.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(32.0)
    }
  }
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {

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
