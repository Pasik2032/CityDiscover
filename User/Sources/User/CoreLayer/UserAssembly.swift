//
//  UserAssembly.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Swinject

public struct UserAssembly: Swinject.Assembly {
  private let assemblys: [Swinject.Assembly] = [
    PresentationAssembly(),
    ServiceLayerAssembly(),
  ]

  public func assemble(container: Swinject.Container) {
    assemblys.forEach { $0.assemble(container: container) }
  }

  public init() {}
}
