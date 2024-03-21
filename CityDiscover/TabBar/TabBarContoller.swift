//
//  TabBarContoller.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//

import UIKit

final class TabBarController: UITabBarController {

//  private let backView = UIView()

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
      switch $0 {
      case .main:
        let feedViewController = MainViewController()
        feedViewController.view.backgroundColor = .clear
        return self.wrappedInNavigationController(with: feedViewController, title: $0.title)
      case .profile:
        let profileViewController = UIViewController()
        profileViewController.view.backgroundColor = .clear
        return self.wrappedInNavigationController(with: profileViewController, title: $0.title)
      case .map:
        let profileViewController = UIViewController()
        profileViewController.view.backgroundColor = .clear
        return self.wrappedInNavigationController(with: profileViewController, title: $0.title)
      case .collection:
        let profileViewController = UIViewController()
        profileViewController.view.backgroundColor = .clear
        return self.wrappedInNavigationController(with: profileViewController, title: $0.title)
      }
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
