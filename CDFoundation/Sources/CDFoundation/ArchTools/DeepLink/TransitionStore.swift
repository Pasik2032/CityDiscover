//
//  TransitionStore.swift
//
//
//  Created by Даниил Пасилецкий on 12.05.2024.
//

import Foundation
import ArchTool
import Swinject

protocol TransitionProvider {
  func getEndPoint(path: URL) -> EndPoint.Type?
}

public protocol TabBarItemProvider {
  func tabBarItemEndPoinds() -> [TabBarItem]
}

public final class TransitionStore {

  private var endPoints: [String: EndPoint.Type] = [:]

  public static let shared: TransitionStore = .init()

  var resolver: Resolver?

  public func register(path: String, endPoint: EndPoint.Type) {
    endPoints[path] = endPoint
  }

  public func register(map: [String: EndPoint.Type]) {
    endPoints = endPoints.merging(map) { (current, _) in current }
  }
}

extension TransitionStore: TransitionProvider {
  func getEndPoint(path: URL) -> EndPoint.Type? {
    let findString = (path.host ?? "") + path.path
    return endPoints[findString]
  }
}

extension TransitionStore: TabBarItemProvider {
  public func tabBarItemEndPoinds() -> [ArchTool.TabBarItem] {
    guard let resolver else { return [] }
    return endPoints.compactMap { (_, endpoint) in
      endpoint.init(resolver: self.resolver!).inTabBarShow()
    }
  }
}
