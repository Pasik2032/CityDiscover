//
//  UserServiceAssembly.swift
//  
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Swinject
import Networking

extension MapService {
  struct Assembly: Swinject.Assembly {
    func assemble(container: Swinject.Container) {
      container.register(MapServiceProtocol.self) {
        MapService(
          networking: $0.resolve(NetworkingProtocol.self)!
        )
      }
    }
  }
}
