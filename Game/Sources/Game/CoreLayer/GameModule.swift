//
//  GameModule.swift
//
//
//  Created by Даниил Пасилецкий on 31.05.2024.
//

import Foundation
import ArchTool
import Swinject

public struct GameModule: Module {
  public static var shared: ArchTool.Module = GameModule()

  public var assembly: Swinject.Assembly = GameAssembly()

  public var deepLinkEndpoints: [String: ArchTool.EndPoint.Type] = [
    "game/main": Collection.EndPoint.self,
  ]
}
