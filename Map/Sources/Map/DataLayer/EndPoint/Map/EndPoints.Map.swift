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
  struct Map: EndPoint {
    typealias Response = [PlaceMap]
    typealias Request = Empty

    var path: String = "map"

    var method: Networking.Method = .get
    var port: Int = 5001

    var javaService: Bool = false

    init(mapBox: MapBox) {
      path.append("?\(mapBox.string)")
    }
  }
}
