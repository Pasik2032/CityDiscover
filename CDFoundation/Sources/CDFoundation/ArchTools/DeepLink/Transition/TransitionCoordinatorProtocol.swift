//
//  TransitionCoordinatorProtocol.swift
//
//
//  Created by Даниил Пасилецкий on 12.05.2024.
//

import Foundation

public protocol TransitionCoordinatorProtocol {
  @discardableResult
  func open(_ url: URL) -> Bool
  func isCanOpen(_ url: URL) -> Bool
}
