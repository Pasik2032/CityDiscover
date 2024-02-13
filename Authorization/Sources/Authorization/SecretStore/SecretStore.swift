//
//  SecretStore.swift
//  
//
//  Created by Даниил Пасилецкий on 30.01.2024.
//

final class SecretStore {
  private let service = "Authorization"
}

extension SecretStore: SecretStoreProtocol {
  func get(_ key: Key) throws -> String {
    let data = try KeychainInterface.readPassword(service: service, account: key.rawValue)
    guard let value = String(data: data, encoding: .utf8) else {
      throw KeychainInterface.KeychainError.invalidItemFormat
    }
    return value
  }

  func save(_ value: String, in key: Key) throws {
    guard let data = value.data(using: .utf8) else {
      throw KeychainInterface.KeychainError.invalidItemFormat
    }
    try KeychainInterface.save(password: data, service: service, account: key.rawValue)
  }

  func update(key: Key, new newValue: String) throws {
    guard let data = newValue.data(using: .utf8) else {
      throw KeychainInterface.KeychainError.invalidItemFormat
    }
    try KeychainInterface.update(password: data, service: service, account: key.rawValue)
  }
}
