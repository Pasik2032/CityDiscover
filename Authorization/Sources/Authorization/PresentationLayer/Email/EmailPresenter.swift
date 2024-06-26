//
//  EmailPresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Networking
import CDUIKit

final class EmailPresenter {

  // MARK: - Properties

  weak var view: EmailViewInput?
  var router: EmailRouterInput?

  private let authorizationService: AuthorizationServiceProtocol

  init(authorizationService: AuthorizationServiceProtocol) {
    self.authorizationService = authorizationService
  }
}

// MARK: - EmailViewOutput

extension EmailPresenter: EmailViewOutput {
  func emailNextDidPressed(email: String) {
    Task { @MainActor in
      do {
        try await authorizationService.sendCode(email: email)
        router?.showCode(email: email)
      } catch AuthorizationService.AuthorizationError.failed(let message) {
        Alert.show(title: "Ошибка!", descriptions: message)
        print("ERROR: \(message)")
      }
    }
  }

  func viewDidLoad() {

  }
}
