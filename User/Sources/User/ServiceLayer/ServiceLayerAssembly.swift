//
//  ServiceLayerAssembly.swift
//  
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Swinject

struct ServiceLayerAssembly: Swinject.Assembly {
  private let assemblys: [Swinject.Assembly] = [
    UserService.Assembly(),
  ]

  func assemble(container: Swinject.Container) {
    assemblys.forEach { $0.assemble(container: container) }
  }
}
