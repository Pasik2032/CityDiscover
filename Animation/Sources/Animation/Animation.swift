//
//  Animation.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

import UIKit

public struct Animation {

  private let name: String

  var value: String {
    switch UIScreen.main.traitCollection.userInterfaceStyle {
    case .dark: "\(name)D"
    default: "\(name)L"
    }
  }

  init(name: String) {
    self.name = name
  }
}
