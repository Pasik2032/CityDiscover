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

    private let output: TabBarOutput
    private let resolver: Resolver = Assembly.resolver

    init(output: TabBarOutput) {
      self.output = output
    }

    func create(_ item: Item) -> UIViewController {
      let profileOutput: ProfileModuleOutput = output
      return switch item {
      case .main: resolver.resolve(MainPlace.self)!.view
      case .profile: resolver.resolve(ProfileViewController.self, argument: profileOutput)!
      case .add: resolver.resolve(AppendViewController.self)!
      case .map: MapViewController()
      case .collection: UIViewController()
      }
    }
  }
}
