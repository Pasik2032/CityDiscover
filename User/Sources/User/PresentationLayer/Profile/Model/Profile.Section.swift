//
//  Profile.Section.swift
//
//
//  Created by Даниил Пасилецкий on 14.05.2024.
//

import Foundation
import UIKit

extension Profile {
  enum Section {
    case header
    case places([Item])
    case exitAction([Item])
  }

  enum Item {
    case exit
    case delete

    case myPlace
    case mysubs
    case mysubscride

    var title: String {
      switch self {
      case .delete: "Удалить акаунт"
      case .exit: "Выйти из аккаунта"
      case .myPlace: "Мои места"
      case .mysubs: "Подписки"
      case .mysubscride: "Подписчики"
      }
    }

    var icon: String {
      switch self {
      case .delete: "rectangle.portrait.and.arrow.right"
      case .exit: "trash.fill"

      case .myPlace: "folder.fill"
      case .mysubs: "person.3.fill"
      case .mysubscride: "person.2"
      }
    }

    var color: UIColor {
      switch self {
      case .delete, .exit: UIColor.systemRed
      case .myPlace, .mysubs, .mysubscride: UIColor.white
      }
    }
  }
}
