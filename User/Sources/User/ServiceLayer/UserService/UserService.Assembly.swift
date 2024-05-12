//
//  UserServiceAssembly.swift
//  
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Swinject
import Networking

extension UserService {
  struct Assembly: Swinject.Assembly {
    func assemble(container: Swinject.Container) {
      container.register(UserServiceProtocol.self) {
        UserService(
          networking: $0.resolve(NetworkingProtocol.self)!
        )
      }
    }
  }
}
