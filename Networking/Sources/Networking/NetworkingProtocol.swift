//
//  NetworkingProtocol.swift
//
//
//  Created by Даниил Пасилецкий on 17.03.2024.
//

public protocol NetworkingProtocol {
  func request<T: EndPoint>(endpoint: T) async throws -> T.Response
  func request<T: EndPoint>(endpoint: T) async throws -> Bool
}
