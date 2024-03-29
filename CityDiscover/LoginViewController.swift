//
//  LoginViewController.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 05.12.2023.
//

import UIKit

class LoginViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    title = "Login Screen"
    let loginButton = UIBarButtonItem(title: "Log In", style: .plain, target: self, action: #selector(login))
    navigationItem.setLeftBarButton(loginButton, animated: true)
  }

  @objc
  private func login() {
    // store the user session (example only, not for the production)
    UserDefaults.standard.set(true, forKey: "LOGGED_IN")
    // navigate to the Main Screen
    RootViewController.shared.switchToMainScreen()
  }
}
