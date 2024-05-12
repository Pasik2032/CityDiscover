//
//  FlowCoordinatorProtocol.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

import Foundation
import CDFoundation

protocol FlowCoordinatorProtocol: MainCoordinatorProtocol {
  func start(in root: RootViewController)
}
