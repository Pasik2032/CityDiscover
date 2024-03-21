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
  private var user: User

  init(userService: UserServiceProtocol, user: User) {
    self.userService = userService
    self.user = user
  }
}

// MARK: - EmailViewOutput

extension SurveyPresenter: SurveyViewOutput {
  func saveDidPressed() {
    router?.showNext(user: user)
  }
  
  func userNameDidChange(new: String?) {
    user.username = new
  }
  
  func ageDidChange(new: Int?) {
    user.age = new
  }
  
  func genderDidChange(new: User.Gender) {
    user.gender = new
  }

  func viewDidLoad() {
    view?.setSection([
      .title,
      .username(user.username),
      .age(user.age),
      .gender(user.gender)
    ])
  }
}
