//
//  PlaceAssembly.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import Swinject

public struct PlaceAssembly: Swinject.Assembly {
  private let assemblys: [Swinject.Assembly] = [
    MainAssembly(),
    PlaceServiceAssembly(),
  ]

  public func assemble(container: Swinject.Container) {
    assemblys.forEach { $0.assemble(container: container) }
  }

  public init() {}
}
