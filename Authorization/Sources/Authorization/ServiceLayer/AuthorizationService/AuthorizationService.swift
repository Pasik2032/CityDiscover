//
//  AuthorizationService.swift
//  
//
//  Created by Даниил Пасилецкий on 19.03.2024.
//

import Networking

protocol AuthorizationServiceProtocol {
  func sendCode(email: String) async throws
  func login(code: String) async throws -> User
  func putUser(user: User) async throws
}

final class AuthorizationService {
  private let networking: NetworkingProtocol
  private let token: TokenProtocol
  private var email: String?

  var user: User?

  init(networking: NetworkingProtocol, token: TokenProtocol) {
    self.networking = networking
    self.token = token
  }
}

extension AuthorizationService: AuthorizationServiceProtocol {
  func putUser(user: User) async throws {
    let endpoint = EndPoints.PutUser(user: user.dto)
    do {
      let result: Bool = try await networking.request(endpoint: endpoint)
      if !result {
        throw AuthorizationError.failed(message: "Извините, произошла неизвестная ошибка")
      }
    } catch NetworkingModule.Errors.failer(let message) {
      throw AuthorizationError.failed(message: message)
    } catch {
      throw AuthorizationError.failed(message: "Извините, произошла неизвестная ошибка")
    }
  }
  
  func sendCode(email: String) async throws {
    let endpoint = SendEmail(email: email)
    do {
      let result: Bool = try await networking.request(endpoint: endpoint)
      if !result {
        throw AuthorizationError.failed(message: "Извините, произошла неизвестная ошибка")
      }
      self.email = email
    } catch NetworkingModule.Errors.failer(let message) {
      throw AuthorizationError.failed(message: message)
    } catch {
      throw AuthorizationError.failed(message: "Извините, произошла неизвестная ошибка")
    }
  }

  func login(code: String) async throws -> User {
    guard let email else {
      throw AuthorizationError.failed(message: "Извините, произошла неизвестная ошибка")
    }
    let endpoint = EndPoints.Login(parameters: .init(email: email, code: code))
    do {
      let result: EndPoints.Login.Response = try await networking.request(endpoint: endpoint)
      token.setupToken(result.token)
      self.user = result.user
      return result.user
    } catch NetworkingModule.Errors.failer(let message) {
      throw AuthorizationError.failed(message: message)
    } catch {
      throw AuthorizationError.failed(message: "Извините, произошла неизвестная ошибка")
    }
  }
}

extension AuthorizationService {
  enum AuthorizationError: Error {
    case failed(message: String)
  }
}
