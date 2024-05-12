//
//  CityDiscoverApp.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 12.05.2024.
//

import UIKit
import Modules
import CDFoundation

final class CityDiscoverApp: UIApplication {

  /// Хранилище всех модулей
  private let modulesProvider: ModulesProvider = ModulesStore.shared
  /// Хранилище переходов
  private let transitionStore = TransitionStore.shared

  override init() {
    super.init()
    start()
  }

  /// Функция вызывается самой первой при старте приложения
  private func start() {
    // Ассемблим все модули
    Assembly.createAssembler(assemblies: modulesProvider.all.map(\.assembly))
    // Регестрируем EndPoint для deepLinks
    transitionStore.register(map: modulesProvider.endPoints)

    // Уведомляем все модули, что приложение запущенно
    modulesProvider.all.forEach { $0.start() }
  }
}
