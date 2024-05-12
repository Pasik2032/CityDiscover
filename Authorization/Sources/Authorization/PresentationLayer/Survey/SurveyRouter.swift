//
//  SurveyRouter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Swinject

protocol SurveyRouterInput {
  func close()
  func showNext(user: User) 
}

final class SurveyRouter {

  // MARK: - Properties

  weak var view: UIViewController?
  private let resolver: Resolver
  private let output: LoginOutput

  init(resolver: Resolver, output: LoginOutput) {
    self.resolver = resolver
    self.output = output
  }
}

// MARK: - SurveyRouterInput

extension SurveyRouter: SurveyRouterInput {
  func close() {
    output.userDidLogin()
  }

  func showNext(user: User) {
    let surveyVC = resolver.resolve(PreferencesViewController.self, arguments: output, user)!
    view?.navigationController?.pushViewController(surveyVC, animated: true)
  }
}
