//
//  Login.Response.swift
//
//
//  Created by Даниил Пасилецкий on 19.03.2024.
//

import Foundation

extension EndPoints.Login {
  struct Response: Decodable {
    let token: Token.Model
    let user: User
  }
}
