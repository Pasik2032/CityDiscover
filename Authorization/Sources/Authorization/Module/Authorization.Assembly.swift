//
//  Authorization.Assembly.swift
//
//
//  Created by Даниил Пасилецкий on 03.03.2024.
//

import Swinject

extension Authorization {
  struct Assembly: Swinject.Assembly {
    public func assemble(container: Container) {
      container.register(AuthorizationProtocol.self) { resolver in
        Authorization(
          tokenService: resolver.resolve(TokenProtocol.self)!,
          fabricLogin: { output in
            resolver.resolve(EmailViewController.self, argument: output)!
          }
        )
      }
    }
  }
}
