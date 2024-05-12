//
//  DetailRouter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 24.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import MapKit

public protocol DetailRouterInput {
  func openMapForPlace(coordinate: Coordinate)
  func showModule()
  func getVC() -> UIViewController
}

final class DetailRouter {

  // MARK: - Properties

  weak var view: UIViewController?
  var initView: UIViewController?
}

// MARK: - DetailRouterInput

extension DetailRouter: DetailRouterInput {
  func showModule() {
    initView = nil
  }
  
  func getVC() -> UIViewController {
    let vc = initView
    initView = nil
    return vc!
  }
  
  func openMapForPlace(coordinate: Coordinate) {
    guard let url = URL(string: "yandexmaps://maps.yandex.ru/?pt=\(coordinate.string)&z=12") else { return }
    UIApplication.shared.open(url)
  }
}
