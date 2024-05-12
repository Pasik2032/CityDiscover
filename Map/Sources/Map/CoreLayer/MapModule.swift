//
//  MapModule.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Foundation
import ArchTool
import Swinject

public struct MapModule: Module {
  public static var shared: ArchTool.Module = MapModule()

  public var assembly: Swinject.Assembly = MapAssembly()

  public var deepLinkEndpoints: [String: ArchTool.EndPoint.Type] = [
    "map": Map.EndPoint.self
  ]
}
