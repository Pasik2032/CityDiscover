//
//  AuthorizationService.Assembly.swift
//
//
//  Created by Даниил Пасилецкий on 30.01.2024.
//

import Swinject

extension AuthorizationService {
  struct Assembly: Swinject.Assembly {

    func assemble(container: Swinject.Container) {
      container.register(AuthorizationServiceProtocol.self) { _ in
        AuthorizationService()
      }
    }
  }
}
