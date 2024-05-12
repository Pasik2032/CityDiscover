//
//  FlowCoordinator.Assembly.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 30.01.2024.
//

import Swinject
import Authorization
import Place
import CDFoundation

extension FlowCoordinator {
  struct Assembly: Swinject.Assembly {
    func assemble(container: Swinject.Container) {
      container.register(FlowCoordinatorProtocol.self) {
        FlowCoordinator(
          authorization: $0.resolve(AuthorizationProtocol.self)!,
          placeService: $0.resolve(PlaceServicePublicProtocol.self)!, 
          transitionCoordinator: $0.resolve(TransitionCoordinatorProtocol.self)!
        )
      }.inObjectScope(.container)

      container.register(MainCoordinatorProtocol.self) {
        $0.resolve(FlowCoordinatorProtocol.self)!
      }
    }
  }
}
