//
//  CardsDataModel.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 22.03.2024.
//

struct CardsDataModel {
  let address: String
  let text: String
  let image: String
  let raiting: Float?
  let categoty: String
  let id: Int

  init(id: Int, address: String, text: String, image: String, raiting: Float?, categoty: String) {
    self.address = address
    self.text = text
    self.image = image
    self.raiting = raiting
    self.categoty = categoty
    self.id = id
  }
}
