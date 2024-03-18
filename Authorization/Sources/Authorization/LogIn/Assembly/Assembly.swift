//
//  Assembly.swift
//
//
//  Created by Даниил Пасилецкий on 03.03.2024.
//

import Swinject
import UIKit
import Networking

enum Login {
  struct Assembly: Swinject.Assembly {
    public func assemble(container: Container) {
      container.register(EmailViewController.self) { (resolver, output: LoginOutput) in
        let view = EmailViewController()
        let presenter = EmailPresenter(networking:  resolver.resolve(NetworkingProtocol.self)!)
        let router = EmailRouter(resolver: resolver, output: output)

        presenter.view = view
        presenter.router = router

        router.view = view

        view.presenter = presenter

        return view
      }

      container.register(CodeViewController.self) { (resolver, output: LoginOutput) in
        let view = CodeViewController()
        let presenter = CodePresenter(output: output)
        let router = CodeRouter()

        presenter.view = view
        presenter.router = router

        router.view = view

        view.presenter = presenter

        return view
      }
    }
  }
}
