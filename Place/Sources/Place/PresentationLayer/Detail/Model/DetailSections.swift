//
//  DetailSections.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import UIKit

enum DetailSection {
  case title(title: String, category: String)
  case map(Coordinate)
  case image([String])
  case description(String)
  case data(rating: Float, counter: String)
  case star(Int?)
  case images([UIImage])
}
