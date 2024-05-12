//
//  UserService.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Foundation
import Networking

final class UserService: UserServiceProtocol {

  private let networking: NetworkingProtocol

  init(networking: NetworkingProtocol) {
    self.networking = networking
  }

  func delete() {
    let endPoint = EndPoints.Delete()
    Task {
      let result: Bool? = try? await networking.request(endpoint: endPoint)
    }
  }
}
