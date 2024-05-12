//
//  UserModule.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Foundation
import ArchTool
import Swinject

public struct UserModule: Module {
  public static var shared: ArchTool.Module = UserModule()

  public var assembly: Swinject.Assembly = UserAssembly()

  public var deepLinkEndpoints: [String: ArchTool.EndPoint.Type] = [
    "collection": Collection.EndPoint.self,
    "profile": Profile.EndPoint.self,
  ]
}
