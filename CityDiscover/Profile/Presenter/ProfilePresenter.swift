//
//  ProfilePresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 25.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Authorization

protocol ProfileModuleOutput: AnyObject {
  func userDidExit()
}

final class ProfilePresenter {

  // MARK: - Properties

  weak var view: ProfileViewInput?
  var router: ProfileRouterInput?
  weak var output: ProfileModuleOutput?

  private let authorization: AuthorizationProtocol

  init(authorization: AuthorizationProtocol) {
    self.authorization = authorization
  }
}

// MARK: - ProfileViewOutput

extension ProfilePresenter: ProfileViewOutput {
  var sections: [ProfileSections] {
    [
      .action([
        .delete
      ])
    ]
  }
  
  func actionDidPressed(_ action: ProfileSections.Action) {
    switch action {
    case .delete:
      authorization.exit()
      output?.userDidExit()
    }
  }

  func viewDidLoad() {

  }
}
