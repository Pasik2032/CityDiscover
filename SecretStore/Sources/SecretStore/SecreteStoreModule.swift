//
//  SecreteStoreModule.swift
//
//
//  Created by Даниил Пасилецкий on 19.05.2024.
//

import ArchTool
import Swinject

public struct SecreteStoreModule: Module {
  public static var shared: Module = SecreteStoreModule()

  public var assembly: Swinject.Assembly = SecretStore.Assembly()
}

