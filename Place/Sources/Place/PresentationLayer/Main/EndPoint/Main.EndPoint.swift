//
//  Main.EndPoint.swift
//
//
//  Created by Даниил Пасилецкий on 16.05.2024.
//

import Foundation
import ArchTool
import Swinject

enum Main {}

extension Main {
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
      let (router, input) = resolver.resolve(MainPlace.self)!

    }

    func inTabBarShow() -> TabBarItem? {
      let (router, input) = resolver.resolve(MainPlace.self)!
      var item = BaseTabBar(title: "Интересные места", icon: "mappin.and.ellipse", vc: router.getVC())
      item.priority = 3
      return item
    }
  }
}
