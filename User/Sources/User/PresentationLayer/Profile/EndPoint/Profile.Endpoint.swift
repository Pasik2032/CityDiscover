//
//  Profile.EndPoint.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Foundation
import ArchTool
import Swinject

enum Profile {}

extension Profile {
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
      let item = BaseTabBar(title: "Профиль", icon: "person.crop.circle", vc: router.getVC())
      item.priority = 4
      return item
    }
  }
}

