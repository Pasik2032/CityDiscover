//
//  PutUser.swift
//
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//

import Networking

extension EndPoints {
  struct PutUser: EndPoint {
    typealias Response = EndPoints.Empty
    typealias Request = User.UserDTO
    var path: String = "user-service/user"
    var method: Networking.Method = .post
    var port: Int = 8050

    var parameters: User.UserDTO?

    init(user: User.UserDTO) {
      self.parameters = user
    }
  }
}
