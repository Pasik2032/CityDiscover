//
//  ProfileSections.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 26.03.2024.
//

import Foundation

enum ProfileSections {
  case info
  case action([Action])
}

extension ProfileSections {
  enum Action {
    case delete

    var title: String {
      switch self {
      case .delete: "Выйти"
      }
    }
  }
}
