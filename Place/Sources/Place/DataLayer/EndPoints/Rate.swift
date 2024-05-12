//
//  File.swift
//  
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Networking

extension EndPoints {
  struct Rate: EndPoint {
    typealias Response = Empty

    var path: String = "recommendation-service/rate_place"
    var method: Networking.Method = .post
    var port: Int = 5001
    var javaService: Bool = false

    var parameters: Request?

    init(parameters: Request) {
      self.parameters = parameters
    }
  }
}

extension EndPoints.Rate {
  struct Request: Codable {
    let placeId: Int
    let rating: Int

    enum CodingKeys: String, CodingKey {
      case placeId = "place_id"
      case rating
    }
  }
}
