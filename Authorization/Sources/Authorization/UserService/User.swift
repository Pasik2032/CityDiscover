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
  var username: String?
  var gender: Gender?
  var age: Int?
  var preferences: [Preference]?

  var dto: UserDTO {
    .init(username: username, gender: gender, age: age, preferences: preferences)
  }
}

extension User {
  struct UserDTO: Codable {
    var username: String?
    var gender: Gender?
    var age: Int?
    var preferences: [Preference]?
  }
}

extension User {
  enum Gender: String, Codable {
    case male = "MALE"
    case female = "FEMALE"
  }
}

extension User {
  struct Preference: Codable {
    let mark: String
    let subcategory_id: String
  }
}
