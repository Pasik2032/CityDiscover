//
//  CodePresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import CDUIKit

final class CodePresenter {

  // MARK: - Properties

  weak var view: CodeViewInput?
  var router: CodeRouterInput?
  private let output: LoginOutput

  private let authorizationService: AuthorizationServiceProtocol

  init(output: LoginOutput, authorizationService: AuthorizationServiceProtocol) {
    self.output = output
    self.authorizationService = authorizationService
  }
}

// MARK: - CodeViewOutput

extension CodePresenter: CodeViewOutput {
  func codeDidSend(_ code: String) {
    Task { @MainActor in
      do {
        let user = try await authorizationService.login(code: code)
        if user.age == nil || user.gender == nil || user.username == nil {
          router?.showProfile(output: output, user: user)
        } else {
          output.userDidLogin()
        }
      } catch AuthorizationService.AuthorizationError.failed(let message) {
        Alert.show(title: "Ошибка!", descriptions: message)
        print("ERROR: \(message)")
      }
    }
  }

  func viewDidLoad() {

  }
}
