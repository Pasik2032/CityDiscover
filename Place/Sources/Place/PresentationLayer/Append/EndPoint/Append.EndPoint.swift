//
//  Append.EndPoint.swift
//
//
//  Created by Даниил Пасилецкий on 16.05.2024.
//

import ArchTool
import Swinject

/// Пространство имен добавления нового места
enum Append {}

extension Append {
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

    func inTabBarShow() -> TabBarItem? {
      let (router, input) = resolver.resolve(Module.self)!

      var item =  BaseTabBar(
        title: "Новое место",
        icon: "plus",
        vc: router.getVC()
      )

      item.priority = 2
      return item
    }
  }
}
