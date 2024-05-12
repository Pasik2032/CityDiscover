//
//  TabBaerItem.swift
//  
//
//  Created by Даниил Пасилецкий on 12.05.2024.
//

import Foundation
import UIKit

public protocol TabBarItem {
  var title: String { get }
  var icon: String { get }
  var vc: UIViewController { get }
  var priority: Int { get }
}

public final class BaseTabBar: TabBarItem {
  public var title: String
  
  public var icon: String
  
  public var vc: UIViewController

  public var priority: Int = 0

  public init(title: String, icon: String, vc: UIViewController) {
    self.title = title
    self.icon = icon
    self.vc = vc
  }
}
