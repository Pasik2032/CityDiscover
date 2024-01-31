//
//  Mode.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

import UIKit

final class Mode {

  static var shared = Mode()

  private init() {}

  enum Style {
    case dark
    case light
  }

  private(set) var current: Style = .light

  func setRoot(_ vc: UIViewController) {
    print("\(vc.traitCollection.userInterfaceStyle)")
    switch vc.traitCollection.userInterfaceStyle {
    case .dark:
      current = .dark
    default:
      current = .light
    }
  }
}
