//
//  Profile.Interactor.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Foundation
import CDFoundation
import Networking

protocol MapInput {}

protocol MapInteractorInput: AnyObject {
  func start(mapBox: MapBox)
}

protocol MapInteractorOutput: AnyObject {
  func show(pins: [PlaceMap])
}

extension Map {
  final class Interactor {
    weak var presenter: MapInteractorOutput?

    private let networking: NetworkingProtocol

    init(
      networking: NetworkingProtocol
    ) {
      self.networking = networking
    }
  }
}

extension Map.Interactor: MapInteractorInput {
  func start(mapBox: MapBox) {
    let endPoint = EndPoints.Map(mapBox: mapBox)
    Task { @MainActor in
      let pins: [PlaceMap] = try await networking.request(endpoint: endPoint)
      self.presenter?.show(pins: pins)
      print("map \(pins)")
    }
  }
}

extension Map.Interactor: MapInput {

}
