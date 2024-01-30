//
//  FlowCoordinator.Assembly.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 30.01.2024.
//

import Swinject

extension FlowCoordinator {
  struct Assembly: Swinject.Assembly {
    func assemble(container: Swinject.Container) {
      container.register(FlowCoordinatorProtocol.self) { _ in
        FlowCoordinator()
      }.inObjectScope(.container)
    }
  }
}
