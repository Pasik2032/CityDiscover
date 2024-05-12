//
//  PresentationAssembly.swift
//
//
//  Created by Даниил Пасилецкий on 31.05.2024.
//

import Foundation
import Swinject

struct PresentationAssembly: Swinject.Assembly {
  private let assemblys: [Swinject.Assembly] = [
    Collection.Assembly(),
  ]

  func assemble(container: Swinject.Container) {
    assemblys.forEach { $0.assemble(container: container) }
  }
}
