//
//  Token.Assembly.swift
//
//
//  Created by Даниил Пасилецкий on 19.03.2024.
//

import Swinject
import Networking

extension Token {
  struct Assembly: Swinject.Assembly {

    func assemble(container: Swinject.Container) {
      container.register(TokenProtocol.self) {
        Token(
          setting: $0.resolve(SettingProtocol.self)!,
          secretStore: $0.resolve(SecretStoreProtocol.self)!,
          networking: $0.resolve(NetworkingProtocol.self)!
        )
      }.inObjectScope(.container)
    }
  }
}
