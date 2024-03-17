//
//  CodeRouter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

protocol CodeRouterInput {
  func close()
}

final class CodeRouter {

  // MARK: - Properties

  weak var view: UIViewController?
}

// MARK: - CodeRouterInput

extension CodeRouter: CodeRouterInput {
  func close() {
    view?.dismiss(animated: true)
  }
}
