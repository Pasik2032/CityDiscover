//
//  ModulesProvider.swift
//  
//
//  Created by Даниил Пасилецкий on 12.05.2024.
//

import ArchTool

public protocol ModulesProvider {
  var all: [Module] { get }
  var endPoints: [String: EndPoint.Type] { get }
}

public final class ModulesStore: ModulesProvider {

  public static let shared: ModulesProvider = ModulesStore()

  private init() {}

  public var all: [Module] {
    modules
  }

  public var endPoints: [String: EndPoint.Type] {
    modules.reduce([String: EndPoint.Type]()) { partialResult, module in
      partialResult.merging(module.deepLinkEndpoints, uniquingKeysWith: {(_, new) in new })
    }
  }
}
