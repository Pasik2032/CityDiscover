//
//  Map.EndPoint.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Foundation
import ArchTool
import Swinject

enum Map {}

extension Map {
  struct EndPoint: ArchTool.EndPoint {

    var resolver: Swinject.Resolver
    var path: String = ""

    init(resolver: Swinject.Resolver) {
      self.resolver = resolver
    }

    func isAvailable() -> Bool {
      true
    }

    func perform() {
      let (router, input) = resolver.resolve(Module.self)!
      router.show()
    }
  }
}

