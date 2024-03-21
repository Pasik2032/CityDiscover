//
//  CardsDataModel.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 22.03.2024.
//

import UIKit
struct CardsDataModel {

  var address: String
  var text : String
  var image : String

  init(address: String, text: String, image: String) {
    self.address = address
    self.text = text
    self.image = image
  }
}
