//
//  EndPoints.Recommendations.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import Networking

enum EndPoints {}

extension EndPoints {
  struct Recommendations: EndPoint {
    typealias Response = [PlaceModel]
    typealias Request = Empty
    
    var path: String = "recommendations"
    var method: Networking.Method = .get
    var port: Int = 5001
    var javaService: Bool = false

    init() {}

    init(lat: Float, lon: Float) {
      path.append("p=\(lat),\(lon)")
    }

  }
  struct Empty: Codable {}
}
