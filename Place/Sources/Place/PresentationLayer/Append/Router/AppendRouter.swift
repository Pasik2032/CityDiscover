//
//  AppendRouter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CDFoundation

protocol AppendRouterInput {
  func show()
  func getVC() -> UIViewController
}

final class AppendRouter {

  // MARK: - Properties

  weak var view: UIViewController?

  var initView: UIViewController?
}

// MARK: - AppendRouterInput

extension AppendRouter: AppendRouterInput {
  func getVC() -> UIViewController {
    let vc = initView
    initView = nil
    return vc!
  }
  
  func show() {
    let top = UIApplication.topViewController()
    top?.present(initView!, animated: true)
    initView = nil
  }
}
