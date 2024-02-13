//
//  RootViewController.swift
//
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

import UIKit
import SnapKit

final class RootViewController: UIViewController {

  var childVwCtrl: UIViewController?

  override func viewDidLoad() {
    super.viewDidLoad()
    hideKeyboardWhenTappedAround()
    view.backgroundColor = .red
    let vc = EmailViewController()
    set(vc)
    childVwCtrl = vc

    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
      self.present(child: CodeViewController())
    }
  }

  func hideKeyboardWhenTappedAround() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }

  @objc func dismissKeyboard() {
    view.endEditing(true)
  }

  func set(_ vc: UIViewController) {
    addChild(vc)
    vc.didMove(toParent: self)
    view.addSubview(vc.view)


    vc.view.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }

  func present(child: UIViewController) {
    addChild(child)
    view.addSubview(child.view)

    child.view.snp.makeConstraints { make in
      make.bottom.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }

    child.view.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
    UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {
      child.view.transform = CGAffineTransform(translationX: 0, y: 0)
      self.childVwCtrl?.view.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
    }, completion: { _ in
      child.didMove(toParent: self)
      self.childVwCtrl?.removeFromParent()
      self.childVwCtrl = child
    })
  }
}
