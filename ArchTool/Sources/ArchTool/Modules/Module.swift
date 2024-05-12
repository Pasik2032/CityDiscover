//
//  Module.swift
//
//
//  Created by Даниил Пасилецкий on 12.05.2024.
//

import Swinject

public protocol Module {
  static var shared: Module { get }
  func start()
  var assembly: Swinject.Assembly { get }
  var deepLinkEndpoints: [String: EndPoint.Type] { get }
}

public extension Module {
  func start() {}
  var deepLinkEndpoints: [String: EndPoint.Type] { [:] }
}
