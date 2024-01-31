//
//  MainViewController.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 05.12.2023.
//

import UIKit

class MainViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.lightGray // to visually distinguish the protected part
    title = "Main Screen"
    let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logout))
    navigationItem.setLeftBarButton(logoutButton, animated: true)
  }

  @objc
  private func logout() {
    // clear the user session (example only, not for the production)
    UserDefaults.standard.set(false, forKey: "LOGGED_IN")
    // navigate to the Main Screen
    RootViewController.shared.switchToLogout()
  }
}
