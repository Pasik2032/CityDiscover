//
//  Palette.Color.swift
//
//
//  Created by Даниил Пасилецкий on 28.01.2024.
//

import UIKit

/// Структура описывающая цвет
public struct ItemColor {
  private let light: UIColor
  private let dark: UIColor

  /// Получение цвета
  public var value: UIColor {
    UIColor.init { trait -> UIColor in
      switch trait.userInterfaceStyle {
      case .dark: return dark
      default: return light
      }
    }
  }

  /// Создание цвета
  /// - Parameters:
  ///   - light: Цвет в светлой теме
  ///   - dark: Цвет в темной теме
  init(light: UIColor, dark: UIColor) {
    self.light = light
    self.dark = dark
  }

  /// Создание цвета
  /// - Parameter universal: Цвет который будет использоваться во всех темах
  init(_ universal: UIColor) {
    self.light = universal
    self.dark = universal
  }

  init(_ hex: Int) {
    self.init(.init(rgb: hex))
  }

  init(light: Int, dark: Int) {
    self.init(light: .init(rgb: light), dark: .init(rgb: dark))
  }
}
