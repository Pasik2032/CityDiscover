//
//  File.swift
//  
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import MapKit

final class PlaceMap: NSObject, Decodable, MKAnnotation {
  var coordinate: CLLocationCoordinate2D {
    .init(latitude: CLLocationDegrees(pos2), longitude: CLLocationDegrees(pos1))
  }

  var title: String? {
    isCluster ? "\(count ?? 3) мест" : name ?? ""
  }

  var count: Int?
  var name: String?
  var id: String
  var pos1: Float
  var pos2: Float
  var isCluster: Bool

  enum CodingKeys: CodingKey {
    case id
    case pos1
    case pos2
    case count
    case name
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    if let str = try? container.decode(String.self, forKey: .id) {
      isCluster = true
      self.id = str
    } else if let number = try? container.decode(Int.self, forKey: .id) {
      isCluster = false
      self.id = String(number)
    } else {
      isCluster = false
      self.id = ""
    }
    self.pos1 = try container.decode(Float.self, forKey: .pos1)
    self.pos2 = try container.decode(Float.self, forKey: .pos2)
    self.count = try container.decodeIfPresent(Int.self, forKey: .count)
    self.name = try container.decodeIfPresent(String.self, forKey: .name)
    super.init()
  }
}
