//
//  MapBox.swift
//  
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import MapKit

struct MapBox {
  let up: Coordinate
  let down: Coordinate

  var string: String {
    "p=\(up.str);\(down.str)"
  }
}

extension MapBox {
  struct Coordinate {
    let lat: Float
    let log: Float

    init(_ coor: CLLocationCoordinate2D) {
      self.lat = Float(coor.latitude)
      self.log = Float(coor.longitude)
    }

    var str: String {
      "\(lat),\(log)"
    }
  }
}
