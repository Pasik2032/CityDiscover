//
//  Login.EndPoint.swift
//
//
//  Created by Даниил Пасилецкий on 19.03.2024.
//

import Networking

enum EndPoints {}

extension EndPoints {
  struct Login: EndPoint {
    
    var path: String = "user-service/auth/login"
    var method: Networking.Method = .post
    var port: Int = 8050
    var parameters: Request?

    init(parameters: Request) {
      self.parameters = parameters
    }
  }
}
