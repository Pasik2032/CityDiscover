//
//  MainAssembly.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import Swinject
import UIKit
import Networking

public typealias MainPlace = (view: UIViewController, input: MainModuleInput)

struct MainAssembly: Swinject.Assembly {
  func assemble(container: Swinject.Container) {
    container.register(MainPlace.self) { resolver in
      let view = MainViewController()
      let presenter = MainPresenter(placeService: resolver.resolve(PlaceServiceProtocol.self)!)
      let router = MainRouter(resolver: resolver)

      presenter.view = view
      presenter.router = router

      router.view = view

      view.presenter = presenter

      return (view, presenter)
    }
  }
}
