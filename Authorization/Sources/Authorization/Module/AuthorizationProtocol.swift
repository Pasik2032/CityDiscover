//
//  AuthorizationProtocol.swift
//
//
//  Created by Даниил Пасилецкий on 03.03.2024.
//

import UIKit

public protocol AuthorizationProtocol {
  func login(output: LoginOutput) -> UIViewController
}
