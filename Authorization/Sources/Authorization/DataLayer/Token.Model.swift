//
//  Token.Model.swift
//
//
//  Created by Даниил Пасилецкий on 19.03.2024.
//

import Foundation

extension Token {
  struct Model: Codable {
    let accessToken: String
    let refreshToken: String
  }
}
