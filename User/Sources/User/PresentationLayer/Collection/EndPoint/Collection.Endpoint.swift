//
//  Collection.EndPoint.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Foundation
import ArchTool
import Swinject

enum Collection {}

extension Collection {
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

    }

    func inTabBarShow() -> TabBarItem? {
      let (router, input) = resolver.resolve(Module.self)!
      var item = BaseTabBar(title: "Подборки", icon: "list.bullet", vc: router.getVC())
      item.priority = 1
      return item
    }
  }
}

