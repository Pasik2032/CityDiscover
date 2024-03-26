//
//  ProfileModuleAssembly.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 25.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Swinject
import Authorization

struct ProfileModuleAssembly: Swinject.Assembly {
  public func assemble(container: Container) {
    container.register(ProfileViewController.self) { (resolver, output: ProfileModuleOutput) in
      let view = ProfileViewController()
      let presenter = ProfilePresenter(authorization: resolver.resolve(AuthorizationProtocol.self)!)
      let router = ProfileRouter()

      presenter.view = view
      presenter.router = router
      presenter.output = output

      router.view = view

      view.presenter = presenter

      return view
    }
  }
}
