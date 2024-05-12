//
//  FlowCoordinator.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

import Authorization
import Foundation
import UIKit
import Place
import CDUIKit
import CDFoundation

final class FlowCoordinator {
  private var root: RootViewController!

  private let authorization: AuthorizationProtocol
  private let placeService: PlaceServicePublicProtocol

  private let transitionCoordinator: TransitionCoordinatorProtocol

  init(
    authorization: AuthorizationProtocol,
    placeService: PlaceServicePublicProtocol,
    transitionCoordinator: TransitionCoordinatorProtocol
  ) {
    self.authorization = authorization
    self.placeService = placeService
    self.transitionCoordinator = transitionCoordinator
  }
}

extension FlowCoordinator: FlowCoordinatorProtocol {
  func start(in root: RootViewController) {
    self.root = root
    Task { @MainActor in
      if await authorization.isLogin {
        showMain()
      } else {
        let vc = authorization.login(output: self)
        self.root.show(vc)
      }
    }
  }

  private func showMain() {
    Task { @MainActor in
      do {
        try await placeService.dowloadInitPlaces()
        let vc = TabBarController(provider: TransitionStore.shared)
        self.root.show(vc)
      } catch {
        Alert.show(title: "Ошибка!", descriptions: "Извините произошла ошибка")
      }
    }
  }
}

extension FlowCoordinator: LoginOutput {
  func userDidLogin() {
    showMain()
  }
}

extension FlowCoordinator: MainCoordinatorProtocol {
  func userExit() {
    let vc = authorization.login(output: self)
    self.root.show(vc)
  }
}
