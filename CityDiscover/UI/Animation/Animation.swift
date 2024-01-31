//
//  Animation.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

struct Animation {
  /// Анимация для светлой темы
  private var light: String
  /// Анимация для темной темы
  private var dark: String

  var value: String {
    switch Mode.shared.current {
    case .dark: light
    case .light: dark
    }
  }

  init(light: String, dark: String) {
    self.light = light
    self.dark = dark
  }

  init(universal: String) {
    self.light = universal
    self.dark = universal
  }
}
