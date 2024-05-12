//
//  MainRouter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 22.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Swinject

protocol MainRouterInput {
  func showDetail(place: PlaceModel)
  func getVC() -> UIViewController
}

final class MainRouter {

  // MARK: - Properties

  weak var view: UIViewController?
  var initView: UIViewController?

  private let resolver: Resolver

  init(resolver: Resolver) {
    self.resolver = resolver
  }
}

// MARK: - MainRouterInput

extension MainRouter: MainRouterInput {
  func showDetail(place: PlaceModel) {
    let (router, input) = resolver.resolve(Detail.Module.self)!
    input.setup(model: place)
    view?.navigationController?.pushViewController(router.getVC(), animated: true)
  }

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
