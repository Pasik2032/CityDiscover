//
//  MapService.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Foundation
import Networking

final class MapService: MapServiceProtocol {

  private let networking: NetworkingProtocol

  init(networking: NetworkingProtocol) {
    self.networking = networking
  }
}
