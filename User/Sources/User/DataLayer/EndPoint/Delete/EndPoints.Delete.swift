//
//  EndPoints.Delete.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Networking

enum EndPoints {
  struct Empty: Codable {}
}

extension EndPoints {
  struct Delete: EndPoint {
    typealias Response = Empty
    typealias Request = Empty

    var path: String = "user-service/user"
    
    var method: Networking.Method = .delete

    var port: Int = 8050
  }
}
