//
//  NetworkingService.swift
//
//
//  Created by Даниил Пасилецкий on 17.03.2024.
//

import Foundation

public final class NetworkingService {
  private let decoder: JSONDecoder
  private let encoder: JSONEncoder
  private let setting: SettingProtocol

  init(decoder: JSONDecoder = JSONDecoder(), encoder: JSONEncoder = JSONEncoder(), setting: SettingProtocol) {
    self.decoder = decoder
    self.encoder = encoder
    self.setting = setting
  }
}

extension NetworkingService: NetworkingProtocol {
  public func request<T>(endpoint: T) async throws -> T.Response where T : EndPoint {
    let urlString = "https://\(setting.domen):\(endpoint.port)/\(endpoint.path)"
    guard let url = URL(string: urlString) else { throw Networking.Errors.url }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = endpoint.method.rawValue
    if let parameters = try? encoder.encode(endpoint.parameters) {
      urlRequest.httpBody = parameters
    }
    let (data, response) = try await URLSession.shared.data(for: urlRequest)

    if (response as? HTTPURLResponse)?.statusCode != 200 {
      guard let model = try? decoder.decode(BaseModel<ErrorModel>.self, from: data) else { throw Networking.Errors.parsing }
      throw Networking.Errors.failer(message: model.response.message)
    }

    guard let model = try? decoder.decode(BaseModel<T.Response>.self, from: data) else { throw Networking.Errors.parsing }

    return model.response
  }

  public func request<T>(endpoint: T) async throws -> Bool where T : EndPoint {
    let urlString = "http://\(setting.domen):\(endpoint.port)/\(endpoint.path)"
    guard let url = URL(string: urlString) else { throw Networking.Errors.url }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = endpoint.method.rawValue
    if let parameters = try? encoder.encode(endpoint.parameters) {
      urlRequest.httpBody = parameters
    }
    let (data, response) = try await URLSession.shared.data(for: urlRequest)

    if (response as? HTTPURLResponse)?.statusCode != 200 {
      guard let model = try? decoder.decode(BaseModel<ErrorModel>.self, from: data) else { throw Networking.Errors.parsing }
      throw Networking.Errors.failer(message: model.response.message)
    }

    if T.Response.self == Empty.self {
      guard let model = try? decoder.decode(EmptyModel.self, from: data) else { throw Networking.Errors.parsing }
      return model.response
    }
    
    return true
  }
}

struct BaseModel<T: Decodable>: Decodable {
  var status: Bool
  var response: T
}

struct EmptyModel: Decodable {
  var response: Bool
}

struct ErrorModel: Decodable {
  var code: String
  var message: String
}
