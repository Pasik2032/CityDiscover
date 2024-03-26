//
//  AppendAssembly.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Swinject

struct AppendAssembly: Swinject.Assembly {
  func assemble(container: Swinject.Container) {
    container.register(AppendViewController.self) { resolver in
      let view = AppendViewController()
      let presenter = AppendPresenter()
      let router = AppendRouter()

      presenter.view = view
      presenter.router = router

      router.view = view

      view.presenter = presenter

      return view
    }
  }
}
