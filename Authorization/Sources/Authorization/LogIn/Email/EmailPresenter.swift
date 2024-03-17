//
//  EmailPresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

final class EmailPresenter {

  // MARK: - Properties

  weak var view: EmailViewInput?
  var router: EmailRouterInput?
}

// MARK: - EmailViewOutput

extension EmailPresenter: EmailViewOutput {
  func emailNextDidPressed(email: String) {
    router?.showCode(email: email)
  }

  func viewDidLoad() {

  }
}
