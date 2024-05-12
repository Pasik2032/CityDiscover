//
//  EndPoint.swift
//
//
//  Created by Даниил Пасилецкий on 12.05.2024.
//

import Foundation
import Swinject

/// Endpoint для обработки DeepLink
public protocol EndPoint {
  init(resolver: Resolver)
  var resolver: Resolver { get set }
  var path: String { get set }
  func isAvailable() -> Bool
  func perform()
  func isPreloginAvailable() -> Bool
  func inTabBarShow() -> TabBarItem?
}

public extension EndPoint {
  func inTabBarShow() -> TabBarItem? { nil }
  func isPreloginAvailable() -> Bool { false }
}
