//
//  SecretStoreProtocol.swift
//
//
//  Created by Даниил Пасилецкий on 30.01.2024.
//

import Foundation

protocol SecretStoreProtocol {
  func get(_ key: SecretStore.Key) throws -> String
  func save(_ value: String, in key: SecretStore.Key) throws
}
