//
//  NetworkingAssembly.swift
//  
//
//  Created by Даниил Пасилецкий on 17.03.2024.
//

import Swinject

public struct NetworkingAssembly: Swinject.Assembly {
  public func assemble(container: Swinject.Container) {
    container.register(SettingProtocol.self) { _ in
      Setting()
    }.inObjectScope(.container)

    container.register(NetworkingProtocol.self) {
      NetworkingService(setting: $0.resolve(SettingProtocol.self)!)
    }
  }

  public init() {}
}
