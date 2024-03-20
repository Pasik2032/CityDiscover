//
//  CodeRouter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Swinject

protocol CodeRouterInput {
  func close()
  func showProfile(output: LoginOutput) 
}

final class CodeRouter {

  // MARK: - Properties

  weak var view: UIViewController?
  private let resolver: Resolver

  init(resolver: Resolver) {
    self.resolver = resolver
  }
}

// MARK: - CodeRouterInput

extension CodeRouter: CodeRouterInput {
  func close() {
    view?.dismiss(animated: true)
  }

  func showProfile(output: LoginOutput) {
    let surveyVC = resolver.resolve(SurveyViewController.self, argument: output)!
    view?.navigationController?.pushViewController(surveyVC, animated: true)
  }
}
