//
//  SecretStore.Assembly.swift
//
//
//  Created by Даниил Пасилецкий on 30.01.2024.
//

import Swinject

extension SecretStore {
  struct Assembly: Swinject.Assembly {
    func assemble(container: Swinject.Container) {
      container.register(SecretStoreProtocol.self) { _ in
        SecretStore()
      }
    }
  }
}
