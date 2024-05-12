//
//  TransitionAssembly.swift
//
//
//  Created by Даниил Пасилецкий on 12.05.2024.
//

import Foundation
import Swinject

final class TransitionAssembly: Swinject.Assembly {
  func assemble(container: Swinject.Container) {
    container.register(TransitionCoordinatorProtocol.self) {
      TransitionCoordinator(provider: $0.resolve(TransitionStore.self)!, resolver: $0)
    }

    container.register(TransitionStore.self) {
      TransitionStore.shared.resolver = $0
      return TransitionStore.shared
    }.inObjectScope(.container)
  }
}
