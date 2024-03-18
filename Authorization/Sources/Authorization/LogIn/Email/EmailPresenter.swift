//
//  EmailPresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Networking

final class EmailPresenter {

  // MARK: - Properties

  weak var view: EmailViewInput?
  var router: EmailRouterInput?

  private let networking: NetworkingProtocol

  init(networking: NetworkingProtocol) {
    self.networking = networking
  }
}

// MARK: - EmailViewOutput

extension EmailPresenter: EmailViewOutput {
  func emailNextDidPressed(email: String) {
    Task {
      let endpoint = SendEmail(email: email)
      do {
        let result: Bool = try await networking.request(endpoint: endpoint)
        router?.showCode(email: email)
      } catch {
        print("Error")
      }
    }
  }

  func viewDidLoad() {

  }
}
