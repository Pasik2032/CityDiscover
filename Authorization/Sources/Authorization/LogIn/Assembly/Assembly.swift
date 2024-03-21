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
        let presenter = EmailPresenter(userService: resolver.resolve(UserServiceProtocol.self)!)
        let router = EmailRouter(resolver: resolver, output: output)

        presenter.view = view
        presenter.router = router

        router.view = view

        view.presenter = presenter

        return view
      }

      container.register(CodeViewController.self) { (resolver, output: LoginOutput) in
        let view = CodeViewController()
        let presenter = CodePresenter(output: output, userService: resolver.resolve(UserServiceProtocol.self)!)
        let router = CodeRouter(resolver: resolver)

        presenter.view = view
        presenter.router = router

        router.view = view

        view.presenter = presenter

        return view
      }

      container.register(SurveyViewController.self) { (resolver, output: LoginOutput, user: User) in
        let view = SurveyViewController()
        let presenter = SurveyPresenter(userService: resolver.resolve(UserServiceProtocol.self)!, user: user)
        let router = SurveyRouter(resolver: resolver, output: output)

        presenter.view = view
        presenter.router = router

        router.view = view

        view.presenter = presenter

        return view
      }

      container.register(PreferencesViewController.self) { (resolver, output: LoginOutput, user: User) in
        let view = PreferencesViewController()
        let presenter = PreferencesPresenter(userService: resolver.resolve(UserServiceProtocol.self)!, user: user, networking: resolver.resolve(NetworkingProtocol.self)!)
        let router = PreferencesRouter(resolver: resolver, output: output)

        presenter.view = view
        presenter.router = router

        router.view = view

        view.presenter = presenter

        return view
      }
    }
  }
}
