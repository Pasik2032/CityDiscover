//
//  MainModuleConfigurator.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 22.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class MainModuleConfigurator {

  // MARK: - Configure

  func configure(
    output: MainModuleOutput? = nil
  ) -> (
    view: MainViewController,
    input: MainModuleInput
  ) {
    let view = MainViewController()
    let presenter = MainPresenter()
    let router = MainRouter()

    presenter.view = view
    presenter.router = router
    presenter.output = output

    router.view = view

    view.presenter = presenter

    return (view, presenter)
  }
}

