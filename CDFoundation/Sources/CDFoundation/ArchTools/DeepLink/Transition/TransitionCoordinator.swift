//
//  TransitionCoordinator.swift
//
//
//  Created by Даниил Пасилецкий on 12.05.2024.
//

import Foundation
import Swinject

final class TransitionCoordinator {
  private let provider: TransitionProvider

  private let resolver: Resolver

  init(provider: TransitionProvider, resolver: Resolver) {
    self.provider = provider
    self.resolver = resolver
  }
}

extension TransitionCoordinator: TransitionCoordinatorProtocol {
  @discardableResult
  public func open(_ url: URL) -> Bool {
    guard
      var endpoint = provider.getEndPoint(path: url)?.init(resolver: resolver),
      endpoint.isAvailable()
    else { return false }

    endpoint.path = url.absoluteString
    endpoint.perform()
    return true
  }
  
  public func isCanOpen(_ url: URL) -> Bool {
    guard
      let endpoint = provider.getEndPoint(path: url)?.init(resolver: resolver)
    else { return false }

    return endpoint.isAvailable()
  }
}
