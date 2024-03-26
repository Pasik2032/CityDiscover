//
//  AppendPresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CDUIKit

protocol AppendModuleInput: AnyObject {

}

protocol AppendModuleOutput: AnyObject {

}

struct AppendModel {
  var name: String?
  var description: String?
  var coordin: Coordinate?
  var image: [UIImage] = []
}

final class AppendPresenter {

  // MARK: - Properties

  weak var view: AppendViewInput?
  var router: AppendRouterInput?
  weak var output: AppendModuleOutput?

  var model: AppendModel = AppendModel()
}

// MARK: - AppendViewOutput

extension AppendPresenter: AppendViewOutput {
  func mapDidChange(coordinate: Coordinate) {
    model.coordin = coordinate
  }
  
  func saveDidPressed() {
    UserPlaceService.shared.places.append(model)
    model = AppendModel()
    Alert.show(title: "Успех!", descriptions: "Место успешно добавленно!")
    view?.clear()
  }
  
  func imageDidChange(_ image: [UIImage]) {
    model.image = image
  }
  
  func nameDidPressed(name: String?, description: String?) {
    model.name = name
    model.description = description
  }
  
  var sections: [AppendSection] {
    [
      .name,
      .location,
      .image
    ]
  }
  

  func viewDidLoad() {

  }
}

// MARK: - AppendInput

extension AppendPresenter: AppendModuleInput {

}
