//
//  DetailPresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 24.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Networking

public protocol DetailModuleInput: AnyObject {
  func setup(model: PlaceModel)
}

final class DetailPresenter {

  // MARK: - Properties

  weak var view: DetailViewInput?
  var router: DetailRouterInput?

  private var model: PlaceModel?

  private let networking: NetworkingProtocol

  init(networking: NetworkingProtocol) {
    self.networking = networking
  }
}

// MARK: - DetailViewOutput

extension DetailPresenter: DetailViewOutput {
  func starDidPressed(index: Int) {
    let endPoint = EndPoints.Rate(parameters: .init(placeId: model?.id ?? 112, rating: index + 1))
    Task {
      let res: Bool? = try? await networking.request(endpoint: endPoint)
    }
  }
  
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
    let endPoint = EndPoints.View(parameters: .init(placeId: model?.id ?? 123))
    Task {
      let res: Bool? = try? await networking.request(endpoint: endPoint)
    }
  }
}

// MARK: - DetailInput

extension DetailPresenter: DetailModuleInput {
  func setup(model: PlaceModel) {
    self.model = model
    view?.update()
  }
}
