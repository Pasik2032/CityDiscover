//
//  Authorization.swift
//  
//
//  Created by Даниил Пасилецкий on 03.03.2024.
//

import UIKit

public struct Authorization {
  public let fabricLogin: (LoginOutput) -> UIViewController

  init(fabricLogin: @escaping (LoginOutput) -> UIViewController) {
    self.fabricLogin = fabricLogin
  }
}

extension Authorization: AuthorizationProtocol {
  public func login(output: LoginOutput) -> UIViewController {
    let vc = fabricLogin(output)
    return UINavigationController(rootViewController: vc)
  }
}
