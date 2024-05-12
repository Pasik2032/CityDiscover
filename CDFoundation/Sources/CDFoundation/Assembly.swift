//
//  Assembly.swift
//
//
//  Created by Даниил Пасилецкий on 12.05.2024.
//

import Swinject

public struct Assembly: Swinject.Assembly {
  private let assemblys: [Swinject.Assembly] = [
    TransitionAssembly(),
  ]

  public func assemble(container: Swinject.Container) {
    assemblys.forEach { $0.assemble(container: container) }
  }

  public init() {}
}
