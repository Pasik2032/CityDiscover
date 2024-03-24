//
//  PlaceServiceAssembly.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import Swinject
import Networking

struct PlaceServiceAssembly: Swinject.Assembly {
  func assemble(container: Swinject.Container) {
    container.register(PlaceServiceProtocol.self) {
      PlaceService(networking: $0.resolve(NetworkingProtocol.self)!)
    }.inObjectScope(.container)

    container.register(PlaceServicePublicProtocol.self) {
      $0.resolve(PlaceServiceProtocol.self)!
    }
  }
}
