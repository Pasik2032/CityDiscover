//
//  KeychainInterface.Error.swift
//
//
//  Created by Даниил Пасилецкий on 30.01.2024.
//

import Foundation

extension KeychainInterface {
  enum KeychainError: Error {
    // Attempted read for an item that does not exist.
    case itemNotFound

    // Attempted save to override an existing item.
    // Use update instead of save to update existing items
    case duplicateItem

    // A read of an item in any format other than Data
    case invalidItemFormat

    // Any operation result status than errSecSuccess
    case unexpectedStatus(OSStatus)
  }
}
