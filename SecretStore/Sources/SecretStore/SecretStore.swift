//
//  SecretStore.swift
//
//
//  Created by Даниил Пасилецкий on 30.01.2024.
//

public final class SecretStore {
  private let service = "Authorization"
}

extension SecretStore: SecretStoreProtocol {
  public func get(_ key: Key) throws -> String {
    let data = try KeychainInterface.readPassword(service: service, account: key.rawValue)
    guard let value = String(data: data, encoding: .utf8) else {
      throw KeychainInterface.KeychainError.invalidItemFormat
    }
    return value
  }

  public func save(_ value: String, in key: Key) throws {
    guard let data = value.data(using: .utf8) else {
      throw KeychainInterface.KeychainError.invalidItemFormat
    }
    do {
      try KeychainInterface.save(password: data, service: service, account: key.rawValue)
    } catch KeychainInterface.KeychainError.duplicateItem {
      try update(key: key, new: value)
    }
  }

  func update(key: Key, new newValue: String) throws {
    guard let data = newValue.data(using: .utf8) else {
      throw KeychainInterface.KeychainError.invalidItemFormat
    }
    try KeychainInterface.update(password: data, service: service, account: key.rawValue)
  }

  public func delete(key: Key) throws {
    guard let data = "".data(using: .utf8) else {
      throw KeychainInterface.KeychainError.invalidItemFormat
    }
    try KeychainInterface.update(password: data, service: service, account: key.rawValue)
  }
}
