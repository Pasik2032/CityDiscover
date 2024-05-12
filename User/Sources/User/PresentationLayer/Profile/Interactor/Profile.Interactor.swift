//
//  Profile.Interactor.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Foundation
import SecretStore
import CDFoundation

protocol ProfileInput {}

protocol ProfileInteractorInput: AnyObject {
  func exit()
  func delete()
}

protocol ProfileInteractorOutput: AnyObject {

}

extension Profile {
  final class Interactor {
    weak var presenter: ProfileInteractorOutput?

    private let secreteStore: SecretStoreProtocol
    private let mainCoordinator: MainCoordinatorProtocol
    private let userService: UserServiceProtocol

    init(
      secreteStore: SecretStoreProtocol,
      mainCoordinator: MainCoordinatorProtocol,
      userService: UserServiceProtocol
    ) {
      self.secreteStore = secreteStore
      self.mainCoordinator = mainCoordinator
      self.userService = userService
    }
  }
}

extension Profile.Interactor: ProfileInteractorInput {
  func exit() {
    try? secreteStore.delete(key: .token)
    mainCoordinator.userExit()
  }
  
  func delete() {
    userService.delete()
    try? secreteStore.delete(key: .token)
    mainCoordinator.userExit()
  }
}

extension Profile.Interactor: ProfileInput {

}
