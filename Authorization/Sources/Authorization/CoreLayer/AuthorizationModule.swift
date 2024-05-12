//
//  AuthorizationModule.swift
//
//
//  Created by Даниил Пасилецкий on 12.05.2024.
//

import ArchTool
import Swinject

public struct AuthorizationModule: Module {
  public static var shared: Module = AuthorizationModule()

  public var assembly: Swinject.Assembly = AuthorizationAssembly()

  public var deepLinkEndpoints: [String: EndPoint.Type] = [:]
}
