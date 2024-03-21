//
//  MainPresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 22.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol MainModuleInput: AnyObject {

}

protocol MainModuleOutput: AnyObject {

}

final class MainPresenter {

  // MARK: - Properties

  weak var view: MainViewInput?
  var router: MainRouterInput?
  weak var output: MainModuleOutput?
}

// MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {

  func viewDidLoad() {

  }
}

// MARK: - MainInput

extension MainPresenter: MainModuleInput {

}
