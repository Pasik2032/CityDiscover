//
//  EmailPresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Networking

final class EmailPresenter {

  // MARK: - Properties

  weak var view: EmailViewInput?
  var router: EmailRouterInput?

  private let userService: UserServiceProtocol

  init(userService: UserServiceProtocol) {
    self.userService = userService
  }
}

// MARK: - EmailViewOutput

extension EmailPresenter: EmailViewOutput {
  func emailNextDidPressed(email: String) {
    Task { @MainActor in
      do {
        try await userService.sendCode(email: email)
        router?.showCode(email: email)
      } catch UserService.UserError.failed(let message) {
        print("message \(message)")
      }
    }
  }

  func viewDidLoad() {

  }
}
