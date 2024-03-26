//
//  Authorization.swift
//  
//
//  Created by Даниил Пасилецкий on 03.03.2024.
//

import UIKit

public struct Authorization {
  public let fabricLogin: (LoginOutput) -> UIViewController
  private let tokenService: TokenProtocol

  init(tokenService: TokenProtocol, fabricLogin: @escaping (LoginOutput) -> UIViewController) {
    self.tokenService = tokenService
    self.fabricLogin = fabricLogin
  }
}

extension Authorization: AuthorizationProtocol {
  public func login(output: LoginOutput) -> UIViewController {
    let vc = fabricLogin(output)
    return UINavigationController(rootViewController: vc)
  }

  public var isLogin: Bool {
    get async {
      await tokenService.start()
    }
  }

  public func exit() {
    tokenService.exit()
  }
}
