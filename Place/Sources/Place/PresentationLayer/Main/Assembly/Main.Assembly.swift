//
//  MainAssembly.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import Swinject
import UIKit
import Networking
import CDFoundation

extension Main {
  
  typealias MainPlace = (router: MainRouterInput, input: MainModuleInput)

  struct Assembly: Swinject.Assembly {
    func assemble(container: Swinject.Container) {
      container.register(MainPlace.self) { resolver in
        let view = MainViewController()
        let presenter = MainPresenter(
          placeService: resolver.resolve(PlaceServiceProtocol.self)!,
          transitionCoordinator: resolver.resolve(TransitionCoordinatorProtocol.self)!
        )
        let router = MainRouter(resolver: resolver)

        presenter.view = view
        presenter.router = router

        router.view = view
        router.initView = view

        view.presenter = presenter

        return (router, presenter)
      }
    }
  }
}
