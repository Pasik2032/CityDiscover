//
//  Profile.Router.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CDFoundation

protocol ProfileRouterInput {
  func show()
  func getVC() -> UIViewController
  func showMyPlace()
  func showSub() 
}

extension Profile {
  final class Router {

    // MARK: - Properties

    weak var view: UIViewController?

    var initView: UIViewController?

    var builDetail: (() -> UIViewController)?
  }
}
// MARK: - AppendRouterInput

extension Profile.Router: ProfileRouterInput {
  func getVC() -> UIViewController {
    let vc = initView
    initView = nil
    return vc!
  }
  
  func show() {
    let top = UIApplication.topViewController()
    top?.present(initView!, animated: true)
    initView = nil
  }

  func showMyPlace() {
    let a = builDetail?()
    let vc = MyPlaceViewController(vc: a!)
    view?.navigationController?.pushViewController(vc, animated: true)
  }

  func showSub() {
    let vc = SubViewController()
    view?.navigationController?.pushViewController(vc, animated: true)
  }
}
