//
//  DetailAssembly.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import UIKit
import Networking
import Swinject

public enum Detail {

  public static var new: UIViewController?

  typealias Module = (router: DetailRouterInput, input: DetailModuleInput)
}

extension Detail {
  struct Assembly: Swinject.Assembly {
    func assemble(container: Swinject.Container) {
      container.register(Module.self) { resolver in
        let view = DetailViewController()
        let presenter = DetailPresenter(networking: resolver.resolve(NetworkingProtocol.self)!)
        let router = DetailRouter()

        presenter.view = view
        presenter.router = router

        router.initView = view
        router.view = view

        view.presenter = presenter

        return (router, presenter)
      }
    }
  }
}
