//
//  Errors.swift
//  
//
//  Created by Даниил Пасилецкий on 17.03.2024.
//

import Foundation

extension Networking {
  enum Errors: Error {
    case failer(message: String)
    case parsing
    case url
  }
}
