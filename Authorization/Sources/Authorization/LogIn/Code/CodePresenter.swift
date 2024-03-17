//
//  CodePresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

final class CodePresenter {

  // MARK: - Properties

  weak var view: CodeViewInput?
  var router: CodeRouterInput?
  private let output: LoginOutput

  init(output: LoginOutput) {
    self.output = output
  }
}

// MARK: - CodeViewOutput

extension CodePresenter: CodeViewOutput {
  func codeDidSend(_ code: String) {
    output.userDidLogin()
  }

  func viewDidLoad() {

  }
}
