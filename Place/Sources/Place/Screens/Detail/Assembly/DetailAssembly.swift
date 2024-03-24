//
//  DetailAssembly.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import UIKit
import Swinject

typealias DetailScreen = (view: UIViewController, input: DetailModuleInput)

struct DetailAssembly: Swinject.Assembly {
  func assemble(container: Swinject.Container) {
    container.register(DetailScreen.self) { resolver in
      let view = DetailViewController()
      let presenter = DetailPresenter()
      let router = DetailRouter()

      presenter.view = view
      presenter.router = router

      router.view = view

      view.presenter = presenter

      return (view, presenter)
    }
  }
}
