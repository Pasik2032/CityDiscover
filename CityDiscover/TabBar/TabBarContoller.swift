//
//  TabBarContoller.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//

import UIKit
import CDFoundation

final class TabBarController: UITabBarController {

  private let provider: TabBarItemProvider

  init(provider: TabBarItemProvider) {
    self.provider = provider
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setGradientBackground()
    setupTabBar()
    selectedIndex = 3
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
    let dataSource = provider.tabBarItemEndPoinds().sorted {
      $0.priority < $1.priority
    }

    self.viewControllers = dataSource.map {
      self.wrappedInNavigationController(with: $0.vc, title: $0.title)
    }

    self.viewControllers?.enumerated().forEach {
      $1.tabBarItem.title = dataSource[$0].title
      $1.tabBarItem.image = UIImage(systemName: dataSource[$0].icon)
      $1.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
    }
  }

  private func wrappedInNavigationController(with: UIViewController, title: Any?) -> UINavigationController {
    return UINavigationController(rootViewController: with)
  }
}
