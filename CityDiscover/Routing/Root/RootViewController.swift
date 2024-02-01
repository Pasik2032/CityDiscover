//
//  RootViewController.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 05.12.2023.
//

import UIKit
import CDUIKit

final class RootViewController: UIViewController {

  private var current: UIViewController

  init() {
    self.current = SplashViewController()
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Mode.shared.setRoot(self)
    addChild(current)
    current.view.frame = view.bounds
    view.addSubview(current.view)
    current.didMove(toParent: self)
  }

  func show(_ vc: UIViewController) {
    animateFadeTransition(to: vc)
  }

  func switchToMainScreen() {
    let mainViewController = MainViewController()
    let mainScreen = UINavigationController(rootViewController: mainViewController)
    animateFadeTransition(to: mainScreen)
  }

  private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
    new.view.frame = CGRect(x: -view.bounds.width, y: 0, width: view.bounds.width, height: view.bounds.height)
    current.willMove(toParent: nil)
    addChild(new)
    transition(from: current, to: new, duration: 0.3, options: [], animations: {
      new.view.frame = self.view.bounds
    }) { completed in
      self.current.removeFromParent()
      new.didMove(toParent: self)
      self.current = new
      completion?()
    }
  }

  private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
    current.willMove(toParent: nil)
    addChild(new)

    transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {
    }) { completed in
      self.current.removeFromParent()
      new.didMove(toParent: self)
      self.current = new
      completion?()
    }
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    Mode.shared.setRoot(self)
  }

  override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
    super.willTransition(to: newCollection, with: coordinator)
    Mode.shared.setRoot(self)
  }
}
