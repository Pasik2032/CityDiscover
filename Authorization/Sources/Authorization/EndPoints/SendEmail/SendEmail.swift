//
//  SendEmail.swift
//
//
//  Created by Даниил Пасилецкий on 18.03.2024.
//

import Networking

struct SendEmail: EndPoint {
  var path: String = "user-service/auth/code"
  var method: Networking.Method = .post
  var port: Int = 8050

  init(email: String) {
    self.path.append("?email=\(email)")
  }
}
