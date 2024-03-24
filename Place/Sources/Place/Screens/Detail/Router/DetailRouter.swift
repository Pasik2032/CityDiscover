//
//  DetailRouter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 24.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import MapKit

protocol DetailRouterInput {
  func openMapForPlace(coordinate: Coordinate)
}

final class DetailRouter {

  // MARK: - Properties

  weak var view: UIViewController?
}

// MARK: - DetailRouterInput

extension DetailRouter: DetailRouterInput {
  func openMapForPlace(coordinate: Coordinate) {
    guard let url = URL(string: "yandexmaps://maps.yandex.ru/?pt=\(coordinate.string)&z=12") else { return }
    UIApplication.shared.open(url)
  }
}
