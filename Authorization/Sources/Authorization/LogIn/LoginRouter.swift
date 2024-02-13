//
//  LoginRouter.swift
//
//
//  Created by Даниил Пасилецкий on 13.02.2024.
//

import UIKit

protocol LoginRouterProtocol {
  func showCode(email: String)
}

final class LoginRouter {
  weak var root: UIViewController?
}

extension LoginRouter: LoginRouterProtocol {
  func showCode(email: String) {
    let vc = CodeViewController()
    setChild(vc)
  }
}

extension LoginRouter {
  private func setChild(_ vc: UIViewController) {
    vc.presentToParentViewController(parent: root!)
//    root?.addChild(vc)
//    vc.didMove(toParent: root)
//    root?.view.addSubview(vc.view)
//
//
//    vc.view.snp.makeConstraints {
//      $0.leading.trailing.bottom.equalToSuperview()
//    }
  }
}

extension UIViewController {
  func presentToParentViewController(parent: UIViewController) {
    parent.addChild(self)
    parent.view.addSubview(self.view)

    self.view.snp.makeConstraints { make in
      make.bottom.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }

    self.view.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
    UIView.animate(withDuration: 0.28, delay: 0.1, options: .curveEaseInOut, animations: {
      self.view.transform = CGAffineTransform(translationX: 0, y: 0)
    }, completion: { _ in
      self.didMove(toParent: parent)
    })
  }

  func dismissChildViewCont() {
    willMove(toParent: nil)

    self.view.transform = CGAffineTransform(translationX: 0, y: 0)
    UIView.animate(withDuration: 0.28, delay: 0.1, options: .curveEaseInOut, animations: {
      self.view.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
    }, completion: { _ in
      self.view.removeFromSuperview()
      self.removeFromParent()
    })
  }
}
