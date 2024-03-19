//
//  User.swift
//
//
//  Created by Даниил Пасилецкий on 19.03.2024.
//

import Foundation

struct User: Codable {
  let id: String
  let email: String
  let username: String?
  let gender: String?
  let age: Int?
}
