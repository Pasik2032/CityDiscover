//
//  PlaceModule.swift
//  
//
//  Created by Даниил Пасилецкий on 13.05.2024.
//

import Foundation
import ArchTool
import Swinject

public struct PlaceModule: Module {
  public static var shared: ArchTool.Module = PlaceModule()

  public var assembly: Swinject.Assembly = PlaceAssembly()

  public var deepLinkEndpoints: [String: ArchTool.EndPoint.Type] = [
    "place/create": Append.EndPoint.self,
    "main": Main.EndPoint.self
  ]
}
