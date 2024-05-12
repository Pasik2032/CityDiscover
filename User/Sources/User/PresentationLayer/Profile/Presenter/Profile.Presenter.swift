//
//  Profile.Presenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

extension Profile {

  final class Presenter {

    // MARK: - Properties

    weak var view: ProfileViewInput?
    var router: ProfileRouterInput?
    var interactor: ProfileInteractorInput?

    private var sections: [Section] = [] {
      didSet {
        view?.setItem(sections: sections)
      }
    }
  }
}

// MARK: - AppendViewOutput

extension Profile.Presenter: ProfileViewOutput {
  func itemDidSelected(item: Profile.Item) {
    switch item {
    case .delete: interactor?.delete()
    case .exit: interactor?.exit()
    case .myPlace: router?.showMyPlace()
    case .mysubs: router?.showSub()
    case .mysubscride: break
    }
  }
  
  func viewDidLoad() {
    sections = [
      .header,
      .places([
        .myPlace,
        .mysubs,
        .mysubscride,
      ]),
      .exitAction([
        .exit,
        .delete
      ])
    ]
  }
}

extension Profile.Presenter: ProfileInteractorOutput {

}
