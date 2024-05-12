//
//  Token.swift
//
//
//  Created by Даниил Пасилецкий on 19.03.2024.
//

import JWTDecode
import Networking
import Foundation
import SecretStore

protocol TokenProtocol {
  func setupToken(_ model: Token.Model)
  func start() async -> Bool
  func exit()
}

final class Token {
  private let setting: SettingProtocol
  private let secretStore: SecretStoreProtocol
  private let networking: NetworkingProtocol

  init(setting: SettingProtocol, secretStore: SecretStoreProtocol, networking: NetworkingProtocol) {
    self.setting = setting
    self.secretStore = secretStore
    self.networking = networking
  }
}

extension Token: TokenProtocol {
  func exit() {
    try? secretStore.delete(key: .token)
  }

  func start() async -> Bool {
    guard let token = try? secretStore.get(.token), !token.isEmpty else { return false }
    return await update(refreshToken: token)
  }
  
  func setupToken(_ model: Token.Model) {
    try? secretStore.save(model.refreshToken, in: .token)
    setting.token = model.accessToken

    setupTimer(accessToken: model.accessToken)
  }
  
  private func setupTimer(accessToken: String) {
    let jwt = try? decode(jwt: accessToken)
    guard let expiresAt = jwt?.expiresAt else { return }
    let timer = expiresAt.timeIntervalSince1970 - Date.now.timeIntervalSince1970 - 10
    Timer.scheduledTimer(withTimeInterval: timer, repeats: false) { [weak self] (t) in
      let refreshToken = try? self?.secretStore.get(.token)
      Task {
        await self?.update(refreshToken: refreshToken ?? "")
      }
    }
  }

  private func update(refreshToken: String) async -> Bool {
    let endpoint = RefreshToken(token: refreshToken)
    let result: RefreshToken.Response? = try? await networking.request(endpoint: endpoint)
    if let result {
      setupToken(result)
      return true
    }
    return false
  }
}
