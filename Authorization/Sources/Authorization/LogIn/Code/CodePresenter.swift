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

  private let userService: UserServiceProtocol

  init(output: LoginOutput, userService: UserServiceProtocol) {
    self.output = output
    self.userService = userService
  }
}

// MARK: - CodeViewOutput

extension CodePresenter: CodeViewOutput {
  func codeDidSend(_ code: String) {
    Task {
      do {
        let user = try await userService.login(code: code)
        if user.age == nil || user.gender == nil || user.username == nil {
          router?.showProfile(output: output)
        } else {
          output.userDidLogin()
        }
      } catch UserService.UserError.failed(let message) {
        Alert.show(title: "Ошибка!", descriptions: message)
        print("ERROR: \(message)")
      }
    }
  }

  func viewDidLoad() {

  }
}
