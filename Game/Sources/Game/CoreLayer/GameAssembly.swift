//
//  GameAssembly.swift
//  
//
//  Created by Даниил Пасилецкий on 31.05.2024.
//

import Swinject

public struct GameAssembly: Swinject.Assembly {
  private let assemblys: [Swinject.Assembly] = [
    PresentationAssembly(),
  ]

  public func assemble(container: Swinject.Container) {
    assemblys.forEach { $0.assemble(container: container) }
  }

  public init() {}
}
