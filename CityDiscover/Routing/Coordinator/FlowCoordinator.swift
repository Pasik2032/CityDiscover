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

final class FlowCoordinator {
  private var root: RootViewController!

  private let authorization: AuthorizationProtocol
  private let placeService: PlaceServicePublicProtocol

  init(
    authorization: AuthorizationProtocol,
    placeService: PlaceServicePublicProtocol
  ) {
    self.authorization = authorization
    self.placeService = placeService
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
        let vc = TabBarController(output: self)
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

extension FlowCoordinator: TabBarOutput {
  func userDidExit() {
    let vc = authorization.login(output: self)
    self.root.show(vc)
  }
}
