//
//  DetailPresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 24.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol DetailModuleInput: AnyObject {
  func setup(model: PlaceModel)
}

final class DetailPresenter {

  // MARK: - Properties

  weak var view: DetailViewInput?
  var router: DetailRouterInput?

  private var model: PlaceModel?
}

// MARK: - DetailViewOutput

extension DetailPresenter: DetailViewOutput {
  func mapDidPressed() {
    guard let coordinate = model?.coordinate else { return }
    router?.openMapForPlace(coordinate: coordinate)
  }

  var section: [DetailSection] {
    guard let model else { return [] }
    var array: [DetailSection] = [
      .title(title: model.name, category: model.subcategory),
      .image(model.image),
    ]
    if let description = model.description {
      array.append(.description(description))
    }

    if let rating = model.rating {
      array.append(.data(rating: rating, counter: model.reviews_count))
    }
    array.append(.star(nil))
    array.append(.map(model.coordinate))
    return array
  }

  func viewDidLoad() {

  }
}

// MARK: - DetailInput

extension DetailPresenter: DetailModuleInput {
  func setup(model: PlaceModel) {
    self.model = model
    view?.update()
  }
}
