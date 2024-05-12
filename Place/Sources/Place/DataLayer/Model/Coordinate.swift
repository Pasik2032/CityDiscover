//
//  Coordinate.swift
//  
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import Foundation
import MapKit

/// Координаты
public struct Coordinate {
  /// Долгота
  let longitude: Float
  /// Широта
  let latitude: Float

  var location: CLLocation {
    .init(latitude: Double(latitude), longitude: Double(longitude))
  }

  var location2D: CLLocationCoordinate2D {
    .init(latitude: Double(latitude), longitude: Double(longitude))
  }

  var string: String { "\(longitude),\(latitude)" }
}
