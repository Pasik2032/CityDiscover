//
//  TabBar.Item.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//

import Foundation

enum TabBar {}

extension TabBar {
  enum Item {
    case profile
    case map
    case main
    case collection

    var title: String {
      switch self {
      case .main: "Главная"
      case .profile: "Профиль"
      case .map: "Карта"
      case .collection: "Подборки"
      }
    }

    var iconName: String {
      switch self {
      case .main: "mappin.and.ellipse"
      case .profile: "person"
      case .map: "map"
      case .collection: "photo.stack"
      }
    }
  }
}
