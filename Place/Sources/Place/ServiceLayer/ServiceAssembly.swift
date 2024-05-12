//
//  ServiceAssembly.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Foundation
import Swinject

struct ServiceAssembly: Swinject.Assembly {
  private let assemblys: [Swinject.Assembly] = [
    PlaceServiceAssembly(),
  ]

  func assemble(container: Swinject.Container) {
    assemblys.forEach { $0.assemble(container: container) }
  }
}
