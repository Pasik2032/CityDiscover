//
//  FlowCoordinator.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

import Authorization
import Foundation
import UIKit

final class FlowCoordinator {
  private var root: RootViewController!

  private let authorization: AuthorizationProtocol

  init(authorization: AuthorizationProtocol) {
    self.authorization = authorization
  }
}

extension FlowCoordinator: FlowCoordinatorProtocol {
  func start(in root: RootViewController) {
    self.root = root
    Task { @MainActor in
      if await authorization.isLogin {
        userDidLogin()
      } else {
        let vc = authorization.login(output: self)
        self.root.show(vc)
      }
    }
//    DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
//    let vc = authorization.login(output: self)
//      self.root.show(vc)
//    }
  }
}

extension FlowCoordinator: LoginOutput {
  func userDidLogin() {
    let vc = UIViewController()
    vc.view.backgroundColor = .cyan
    self.root.show(vc)
  }
}
