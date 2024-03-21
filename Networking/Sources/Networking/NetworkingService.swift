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
    let urlString = "http://\(setting.domen):\(endpoint.port)/\(endpoint.path)"
    guard let url = URL(string: urlString) else { throw NetworkingModule.Errors.url }
    var urlRequest = URLRequest(url: url)
    urlRequest.allHTTPHeaderFields = [
      "Content-Type": "application/json"
    ]

    urlRequest.httpMethod = endpoint.method.rawValue
    if let modelParam = endpoint.parameters, let parameters = try? encoder.encode(modelParam) {
      urlRequest.httpBody = parameters
    }
    let (data, response) = try await URLSession.shared.data(for: urlRequest)

    if (response as? HTTPURLResponse)?.statusCode != 200 {
      guard let model = try? decoder.decode(BaseModel<ErrorModel>.self, from: data) else { throw NetworkingModule.Errors.parsing }
      throw NetworkingModule.Errors.failer(message: model.response.message)
    }

    if endpoint.javaService {
      guard let model = try? decoder.decode(BaseModel<T.Response>.self, from: data) else { throw NetworkingModule.Errors.parsing }
      return model.response
    } else {
      guard let model = try? decoder.decode(T.Response.self, from: data) else { throw NetworkingModule.Errors.parsing }
      return model as! T.Response
    }
  }

  public func request<T>(endpoint: T) async throws -> Bool where T : EndPoint {
    let urlString = "http://\(setting.domen):\(endpoint.port)/\(endpoint.path)"
    guard let url = URL(string: urlString) else { throw NetworkingModule.Errors.url }
    var urlRequest = URLRequest(url: url)
    var header = [
      "Content-Type": "application/json"
    ]

    if let token = setting.token {
      header["Authorization"] = token
    }
    urlRequest.allHTTPHeaderFields = header
    urlRequest.httpMethod = endpoint.method.rawValue
    if let modelParam = endpoint.parameters, let parameters = try? encoder.encode(modelParam) {
      urlRequest.httpBody = parameters
    }
    let (data, response) = try await URLSession.shared.data(for: urlRequest)

    if (response as? HTTPURLResponse)?.statusCode != 200 {
      guard let model = try? decoder.decode(BaseModel<ErrorModel>.self, from: data) else { throw NetworkingModule.Errors.parsing }
      throw NetworkingModule.Errors.failer(message: model.response.message)
    }

    if T.Response.self == Empty.self {
      guard let model = try? decoder.decode(EmptyModel.self, from: data) else { throw NetworkingModule.Errors.parsing }
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
