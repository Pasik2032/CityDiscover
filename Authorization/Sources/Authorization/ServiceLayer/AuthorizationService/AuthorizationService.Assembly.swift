//
//  UserService.Assembly.swift
//
//
//  Created by Даниил Пасилецкий on 19.03.2024.
//

import Swinject
import Networking

extension AuthorizationService {
  struct Assembly: Swinject.Assembly {

    func assemble(container: Swinject.Container) {
      container.register(AuthorizationServiceProtocol.self) {
        AuthorizationService(
          networking: $0.resolve(NetworkingProtocol.self)!,
          token: $0.resolve(TokenProtocol.self)!
        )
      }.inObjectScope(.container)
    }
  }
}
