//
//  PutUser.swift
//
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//

import Networking

extension EndPoints {
  struct PutUser: EndPoint {
    typealias Request = User
    var path: String = "user"
    var method: Networking.Method = .post
    var port: Int = 8050

    var parameters: User?

    init(user: User) {
      self.parameters = user
    }
  }
}
