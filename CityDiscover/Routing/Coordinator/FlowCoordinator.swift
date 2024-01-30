//
//  FlowCoordinator.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

import Authorization

final class FlowCoordinator {
  private var root: RootViewController!

  private let authorization: AuthorizationServiceProtocol

  init(authorization: AuthorizationServiceProtocol) {
    self.authorization = authorization
  }
}

extension FlowCoordinator: FlowCoordinatorProtocol {
  func start(in root: RootViewController) {
    self.root = root

    
  }
}
