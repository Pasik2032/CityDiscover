//
//  Collection.View.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CDUIKit

protocol CollectionViewInput: AnyObject {

}

protocol CollectionViewOutput: AnyObject {
  func viewDidLoad()
}

extension Collection {
  final class View: ViewController {

    // MARK: - UI


    // MARK: - Properties

    var presenter: CollectionViewOutput?


    // MARK: - UIViewController

    override func viewDidLoad() {
      super.viewDidLoad()
      presenter?.viewDidLoad()

    }

    // MARK: - Actions


    // MARK: - Setup

    private func setupUI() {
      view.backgroundColor = .ds(.mainBackground)
    }
  }
}

// MARK: - AppendViewInput

extension Collection.View: CollectionViewInput {

}
