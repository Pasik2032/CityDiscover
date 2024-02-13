//
//  AuthorizationService.swift
//  Authorization.CityDiscover
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

final class AuthorizationService {
  private let secretStore: SecretStoreProtocol

  init(secretStore: SecretStoreProtocol) {
    self.secretStore = secretStore
  }
}

extension AuthorizationService: AuthorizationServiceProtocol {
  var isLogin: Bool {
    let token = try? secretStore.get(.token)
    return token != nil
  }
}
