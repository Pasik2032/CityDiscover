//
//  PlaceModel.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import Foundation

struct PlaceModel: Decodable {
  let address: String
  let category: String
  let description: String?
  let id: Int
  let image: [String]
  let name: String
  let pos1: Float
  let pos2: Float
  let rating: Float?
  let subcategory: String
  let reviews_count: String

  var coordinate: Coordinate { .init(longitude: pos1, latitude: pos2) }
}
