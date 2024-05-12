//
//  Map.Router.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CDFoundation

protocol MapRouterInput {
  func show()
  func getVC() -> UIViewController
  func close()
}

extension Map {
  final class Router {

    // MARK: - Properties

    weak var view: UIViewController?

    var initView: UIViewController?
  }
}
// MARK: - AppendRouterInput

extension Map.Router: MapRouterInput {
  func close() {
    view?.dismiss(animated: true)
  }
  
  func getVC() -> UIViewController {
    let vc = initView
    initView = nil
    return vc!
  }
  
  func show() {
    let top = UIApplication.topViewController()

    if let nc = top as? UINavigationController {
      nc.pushViewController(initView!, animated: true)
    } else if let nc = top?.navigationController {
      nc.pushViewController(initView!, animated: true)
    } else {
      let nc = UINavigationController(rootViewController: initView!)
      nc.modalPresentationStyle = .fullScreen
      top?.present(nc, animated: true)
    }
    initView = nil
  }
}
