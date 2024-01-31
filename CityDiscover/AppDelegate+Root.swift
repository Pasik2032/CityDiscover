//
//  AppDelegate+Root.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 05.12.2023.
//

import UIKit

extension SceneDelegate {
  static var shared: SceneDelegate {
    let scene = UIApplication.shared.connectedScenes.first
    guard let sd: SceneDelegate = (scene?.delegate as? SceneDelegate) else {
      fatalError("Не удалось получить SceneDelegate")
    }
    return sd
  }

  var rootViewController: RootViewController {
    return window!.rootViewController as! RootViewController
  }
}

extension RootViewController {
  static var shared: RootViewController {
    SceneDelegate.shared.rootViewController
  }
}
