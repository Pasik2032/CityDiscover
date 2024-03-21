//
//  PreferencesPresenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 11.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Networking
import CDUIKit

final class PreferencesPresenter {

  // MARK: - Properties

  weak var view: PreferencesViewInput?
  var router: PreferencesRouterInput?

  private let userService: UserServiceProtocol
  private let networking: NetworkingProtocol
  private let user: User

  private var categories: [EndPoints.Categories.Categor] = []
  private var tags: [String] = ["Add", "two", "tags", "dshgsshjjsds", "fgshdskdls"]
  private var selectTag: [Int] = []

  init(userService: UserServiceProtocol, user: User, networking: NetworkingProtocol) {
    self.userService = userService
    self.user = user
    self.networking = networking
  }

  private func findId(name: String) -> Int {
    for i in categories {
      if i.name == name {
        return i.id
      } else {
        for a in i.subcategory {
          if a.name == name {
            return a.id
          }
        }
      }
    }

    return -1
  }
}

// MARK: - EmailViewOutput

extension PreferencesPresenter: PreferencesViewOutput {
  func tagDidPressed(name: String, isSelected: Bool) {
    if let current = categories.first(where: { $0.name == name }) {
      if isSelected {
        selectTag.append(current.id)
        view?.insertTag(current.subcategory.map { $0.name })
      } else {
        selectTag.remove(at: selectTag.firstIndex(where: { $0 == current.id })!)
        view?.deleteTag(current.subcategory.map { $0.name })
      }
    } else {
      if isSelected {
        selectTag.append(findId(name: name))
      } else {
        selectTag.remove(at: findId(name: name))
      }
    }
  }
  
  func saveDidPressed() {
    print("ID \(selectTag)")
  }
  
  func viewDidLoad() {
    Task { @MainActor in
      let endpoint = EndPoints.Categories()
      let result: EndPoints.Categories.Response = try await networking.request(endpoint: endpoint)
      print("result \(result)")
      self.categories = result
      self.tags = result.map { $0.name }
      view?.startTag(tags)
    }
  }
}
