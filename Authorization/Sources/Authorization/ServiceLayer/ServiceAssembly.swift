//
//  ServiceAssembly.swift
//
//
//  Created by Даниил Пасилецкий on 19.05.2024.
//

import Foundation
import Swinject

struct ServiceAssembly: Swinject.Assembly {
  private let assemblys: [Swinject.Assembly] = [
    AuthorizationService.Assembly(),
    Token.Assembly(),
    Authorization.Assembly(),
  ]

  func assemble(container: Swinject.Container) {
    assemblys.forEach { $0.assemble(container: container) }
  }
}
