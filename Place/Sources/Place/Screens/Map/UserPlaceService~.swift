//
//  UserPlaceService.swift
//  
//
//  Created by Даниил Пасилецкий on 26.03.2024.
//

import Foundation

final class UserPlaceService {
  private init() {}

  static let shared: UserPlaceService = .init()

  var places: [AppendModel] = []
}
