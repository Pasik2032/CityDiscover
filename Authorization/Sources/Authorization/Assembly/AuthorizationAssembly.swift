//
//  AuthorizationAssembly.swift
//
//
//  Created by Даниил Пасилецкий on 30.01.2024.
//

import Swinject

public struct AuthorizationAssembly: Swinject.Assembly {
  private let assemblys: [Swinject.Assembly] = [
    AuthorizationService.Assembly(),
    SecretStore.Assembly(),
    Login.Assembly(),
    Authorization.Assembly(),
  ]

  public func assemble(container: Swinject.Container) {
    assemblys.forEach { $0.assemble(container: container) }
  }

  public init() {}
}
