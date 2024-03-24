//
//  MainPresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 22.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import CDUIKit

public protocol MainModuleInput: AnyObject {

}

final class MainPresenter {

  // MARK: - Properties

  weak var view: MainViewInput?
  var router: MainRouterInput?

  private var places: [PlaceModel] = []

  private let placeService: PlaceServiceProtocol

  init(placeService: PlaceServiceProtocol) {
    self.placeService = placeService
  }
}

// MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {
  func cardDidPressed(id: Int) {
    guard let place = places.first(where: { $0.id == id }) else { return }
    router?.showDetail(place: place)
  }

  func viewDidLoad() {
    self.places = placeService.initPlaces()
    self.view?.setItem(models: places.map {
      CardsDataModel(
        id: $0.id,
        address: $0.address,
        text: $0.name,
        image: $0.image.first!,
        raiting: $0.rating,
        categoty: $0.subcategory
      )
    })
  }
}

// MARK: - MainInput

extension MainPresenter: MainModuleInput {

}
