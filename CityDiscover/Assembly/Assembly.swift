//
//  Assembly.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 29.01.2024.
//

import Swinject
import Authorization
import Networking
import Place

public final class Assembly {

  static func createAssembler(assemblies: [Swinject.Assembly]) {
    assembler = Assembler(assemblies + self.assemblies, container: container)
  }

  private static let assemblies: [Swinject.Assembly] = [
    FlowCoordinator.Assembly(),
    AuthorizationAssembly(),
    NetworkingAssembly(),
    PlaceAssembly(),
    ProfileModuleAssembly(),
  ]

  private static let container = Container()
  private static var assembler: Assembler!

  static let resolver = (assembler.resolver as! Container).synchronize()
}
