//
//  PlaceService.swift
//  
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import Networking

public protocol PlaceServicePublicProtocol: AnyObject {
  func dowloadInitPlaces() async throws
}

protocol PlaceServiceProtocol: AnyObject, PlaceServicePublicProtocol {
  func initPlaces() -> [PlaceModel]
}

public final class PlaceService {
  private let networking: NetworkingProtocol

  private var places: [PlaceModel] = []

  init(networking: NetworkingProtocol) {
    self.networking = networking
  }
}

extension PlaceService: PlaceServiceProtocol {
  public func dowloadInitPlaces() async throws {
    let endpoint = EndPoints.Recommendations()
    let places: EndPoints.Recommendations.Response = try await networking.request(endpoint: endpoint)
    self.places = places
  }

  func initPlaces() -> [PlaceModel] {
    places
  }
}
