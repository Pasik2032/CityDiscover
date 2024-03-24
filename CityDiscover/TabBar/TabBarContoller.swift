//
//  TabBarContoller.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//

import UIKit

final class TabBarController: UITabBarController {

  private let fabric = TabBar.Fabric()

  override func viewDidLoad() {
    super.viewDidLoad()
    setGradientBackground()
    setupTabBar()
    selectedIndex = 2
  }

  func setGradientBackground() {
    let topColor: UIColor = .ds(.mainBackgroundLight)
    let bottomColor: UIColor = .ds(.mainBackground)
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.9)
    gradientLayer.shouldRasterize = true
    view.layer.insertSublayer(gradientLayer, at: 0)
  }

  private func setupTabBar() {
    let dataSource: [TabBar.Item] = [.collection, .map, .main, .profile]
    self.viewControllers = dataSource.map {
       self.wrappedInNavigationController(with: fabric.create($0), title: $0.title)
    }

    self.viewControllers?.enumerated().forEach {
      $1.tabBarItem.title = nil
      $1.tabBarItem.image = UIImage(systemName: dataSource[$0].iconName)
      $1.tabBarItem.imageInsets = UIEdgeInsets(top: .zero, left: .zero, bottom: -5, right: .zero)
    }
  }

  private func wrappedInNavigationController(with: UIViewController, title: Any?) -> UINavigationController {
    return UINavigationController(rootViewController: with)
  }
}
