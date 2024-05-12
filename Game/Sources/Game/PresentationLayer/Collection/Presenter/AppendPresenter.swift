//
//  AppendPresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

extension Collection {

  final class Presenter {

    // MARK: - Properties

    weak var view: CollectionViewInput?
    var router: CollectionRouterInput?
  }
}

// MARK: - AppendViewOutput

extension Collection.Presenter: CollectionViewOutput {
  func viewDidLoad() {

  }
}
