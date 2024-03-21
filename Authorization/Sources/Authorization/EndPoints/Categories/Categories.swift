//
//  Categories.swift
//
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//

import Networking

extension EndPoints {
  struct Categories: EndPoint {
    typealias Request = Empty
    typealias Response = [Categor]
    var path: String = "categories"
    var method: Networking.Method = .get
    var port: Int = 5001
    var javaService = false
  }

  struct Empty: Codable {}
}
