//
//  EmailPresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Networking
import CDUIKit

final class SurveyPresenter {

  // MARK: - Properties

  weak var view: SurveyViewInput?
  var router: SurveyRouterInput?

  private let userService: UserServiceProtocol

  init(userService: UserServiceProtocol) {
    self.userService = userService
  }
}

// MARK: - EmailViewOutput

extension SurveyPresenter: SurveyViewOutput {
  func emailNextDidPressed(email: String) {
  }

  func viewDidLoad() {

  }
}
