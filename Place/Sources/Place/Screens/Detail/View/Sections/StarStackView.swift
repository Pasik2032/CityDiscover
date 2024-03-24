//
//  StarStackView.swift
//
//
//  Created by Даниил Пасилецкий on 25.03.2024.
//

import UIKit

final class StarStackView: UIStackView {
  init() {
    super.init(frame: .zero)
    setupUI()
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    spacing = 8.0
    (0...4).forEach {
      let button = UIButton()
      button.setImage(UIImage(systemName: "star"), for: .normal)
      button.tag = $0
      button.imageView?.snp.makeConstraints { $0.size.equalTo(35.0) }
      button.imageView?.tintColor = .ds(.mainTint)
      button.addTarget(self, action: #selector(starDidPressed), for: .touchUpInside)
      addArrangedSubview(button)
    }
  }

  @objc private func starDidPressed(_ sender: UIView) {
    let index = sender.tag

    for view in arrangedSubviews where view.tag <= index {
      let button = view as? UIButton
      if view.tag <= index {
        button?.setImage(UIImage(systemName: "star.fill"), for: .normal)
      } else {
        button?.setImage(UIImage(systemName: "star"), for: .normal)
      }
    }
  }
}
