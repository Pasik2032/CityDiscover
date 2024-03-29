//
//  FlowCoordinator.Assembly.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 30.01.2024.
//

import Swinject
import Authorization

extension FlowCoordinator {
  struct Assembly: Swinject.Assembly {
    func assemble(container: Swinject.Container) {
      container.register(FlowCoordinatorProtocol.self) {
        FlowCoordinator(
          authorization: $0.resolve(AuthorizationServiceProtocol.self)!
        )
      }.inObjectScope(.container)
    }
  }
}
