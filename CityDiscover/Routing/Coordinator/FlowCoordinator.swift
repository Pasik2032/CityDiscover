//
//  FlowCoordinator.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

final class FlowCoordinator {
  private var root: RootViewController!
}

extension FlowCoordinator: FlowCoordinatorProtocol {
  func start(in root: RootViewController) {
    self.root = root

  }
}
