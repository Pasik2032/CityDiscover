//
//  EndPoint.swift
//  
//
//  Created by Даниил Пасилецкий on 17.03.2024.
//

import Foundation

public protocol EndPoint {
  associatedtype Response: Decodable
  associatedtype Request: Encodable
  
  var path: String { get }
  var method: Method { get }
  var port: Int { get }
  var parameters: Request? { get }

  var javaService: Bool { get }
}

public extension EndPoint {
  typealias Response = Empty
  var parameters: Request? { nil }
  var javaService: Bool { true }
}

public struct Empty: Codable {}
