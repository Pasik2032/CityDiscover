//
//  Collection.Presenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol UpDate {
  func update()
}

extension Collection {

  final class Presenter {

    // MARK: - Properties

    weak var view: CollectionViewInput?
    var router: CollectionRouterInput?
  }
}

// MARK: - AppendViewOutput

extension Collection.Presenter: CollectionViewOutput, UpDate {
  func update() {
  }

  func add() {
    router?.showAdd(self)
  }
  
  func viewDidLoad() {
  }
}
