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
}

final class MainRouter {

  // MARK: - Properties

  weak var view: UIViewController?
  private let resolver: Resolver

  init(resolver: Resolver) {
    self.resolver = resolver
  }
}

// MARK: - MainRouterInput

extension MainRouter: MainRouterInput {
  func showDetail(place: PlaceModel) {
    let (detail, input) = resolver.resolve(DetailScreen.self)!
    input.setup(model: place)
    view?.navigationController?.pushViewController(detail, animated: true)
  }
}
