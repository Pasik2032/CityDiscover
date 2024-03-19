//
//  Login.Request.swift
//
//
//  Created by Даниил Пасилецкий on 19.03.2024.
//

import Foundation

extension EndPoints.Login {
  struct Request: Encodable {
    let email: String
    let code: String
  }
}
