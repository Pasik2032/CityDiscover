//
//  Categories.Response.swift
//
//
//  Created by Даниил Пасилецкий on 21.03.2024.
//

import Foundation

extension EndPoints.Categories {
  struct Categor: Codable {
    let id: Int
    let name: String
    let subcategory: [Subcategory]
  }
}

extension EndPoints.Categories.Categor {
  struct Subcategory: Codable {
    let id: Int
    let name: String
  }
}
