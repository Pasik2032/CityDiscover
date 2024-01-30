//
//  Assembly.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 29.01.2024.
//

import Swinject
import Authorization

public final class Assembly {
  private static let assemblies: [Swinject.Assembly] = [
    FlowCoordinator.Assembly(),
    Authorization.AssemblyModule(),
  ]

  private static let container = Container()
  private static let assembler = Assembler(assemblies, container: container)

  static let resolver = (assembler.resolver as! Container).synchronize()
}
