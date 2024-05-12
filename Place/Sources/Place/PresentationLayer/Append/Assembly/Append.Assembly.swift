//
//  Append.Assembly.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Swinject

extension Append {

  typealias Module = (router: AppendRouter, input: AppendInput)

  struct Assembly: Swinject.Assembly {
    func assemble(container: Swinject.Container) {
      container.register(Module.self) { resolver in
        let view = AppendViewController()
        let presenter = AppendPresenter()
        let router = AppendRouter()
        let interactor = Interactor()

        presenter.view = view
        presenter.router = router

        router.view = view
        router.initView = view
        
        view.presenter = presenter

        return (router, interactor)
      }
    }
  }
}
