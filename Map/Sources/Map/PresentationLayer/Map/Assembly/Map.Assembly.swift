//
//  Map.Assembly.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Swinject
import SecretStore
import CDFoundation
import Networking

extension Map {

  typealias Module = (router: Router, input: MapInput)

  struct Assembly: Swinject.Assembly {
    func assemble(container: Swinject.Container) {
      container.register(Module.self) { resolver in
        let view = View()
        let presenter = Presenter()
        let router = Router()
        let interactor = Interactor(
          networking: resolver.resolve(NetworkingProtocol.self)!
        )

        interactor.presenter = presenter

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        router.view = view
        router.initView = view
        
        view.presenter = presenter

        return (router, interactor)
      }
    }
  }
}
