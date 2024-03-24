//
//  TabBar.Fabric.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import UIKit
import Swinject
import Place

extension TabBar {
  final class Fabric {

    private let resolver: Resolver = Assembly.resolver

    func create(_ item: Item) -> UIViewController {
      switch item {
      case .main: resolver.resolve(MainPlace.self)!.view
      case .collection, .profile, .map, .add: UIViewController()
      }
    }
  }
}
