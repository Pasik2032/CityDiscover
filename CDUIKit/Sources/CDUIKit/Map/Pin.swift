//
//  Pin.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import MapKit

final public class Pin: NSObject, MKAnnotation {
  public var coordinate: CLLocationCoordinate2D

  public init(coordinate: CLLocationCoordinate2D) {
    self.coordinate = coordinate
  }
}
