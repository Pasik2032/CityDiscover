//
//  EmailRouter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Swinject

protocol EmailRouterInput {
  func showCode(email: String)
}

final class EmailRouter {

  // MARK: - Properties

  weak var view: UIViewController?
  private let resolver: Resolver
  private let output: LoginOutput

  init(resolver: Resolver, output: LoginOutput) {
    self.resolver = resolver
    self.output = output
  }
}

// MARK: - EmailRouterInput

extension EmailRouter: EmailRouterInput {
  func showCode(email: String) {
    let codeVC = resolver.resolve(CodeViewController.self, argument: output)!
    codeVC.emailText = email
    view?.navigationController?.pushViewController(codeVC, animated: true)
  }
}
