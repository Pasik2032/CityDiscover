//
//  Request.swift
//
//
//  Created by Даниил Пасилецкий on 18.03.2024.
//

import Foundation

extension SendEmail {
  struct Request: Encodable {
    let email: String
  }
}
