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

    enum CodingKeys: CodingKey {
      case name
      case code
    }

    init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
      let code = try container.decodeIfPresent(String.self, forKey: .code)
      switch code {
      case "MALE": self = .male
      case "FEMALE": self = .female
      default: throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Неверное значение"))
      }
    }
  }
}

extension User {
  struct Preference: Codable {
    let mark: String
    let subcategory_id: String
  }
}
