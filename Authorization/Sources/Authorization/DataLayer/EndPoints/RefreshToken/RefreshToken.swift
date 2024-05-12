//
//  RefreshToken.swift
//
//
//  Created by Даниил Пасилецкий on 18.03.2024.
//

import Networking

struct RefreshToken: EndPoint {
  typealias Response = Token.Model
  var path: String = "user-service/auth/refresh"
  var method: Networking.Method = .get
  var port: Int = 8050

  init(token: String) {
    self.path.append("?refresh=\(token)")
  }

  struct Request: Codable {}
}
