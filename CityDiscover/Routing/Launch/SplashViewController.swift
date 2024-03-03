//
//  SplashViewController.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 05.12.2023.
//

import UIKit
import CDUIKit
import SnapKit
import Animation

final class SplashViewController: UIViewController {

  private lazy var lottie: AnimationView = {
    let lottie = AnimationView(.findMap)
    lottie.contentMode = .scaleAspectFit
    lottie.loopMode = .loop
    lottie.animationSpeed = 0.5
    return lottie
  }()

  private lazy var label: UILabel = {
    let label = UILabel()
    label.text = "City\nDiscover"
    label.textColor = .ds(.mainTint)
    label.numberOfLines = 0
    label.textAlignment = .center
    label.fontSize = 40.0
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }

  private func configureUI() {
    view.backgroundColor = .ds(.mainBackground)
    view.addSubviews([label, lottie])

    label.snp.makeConstraints {
      $0.centerY.equalToSuperview().dividedBy(2)
      $0.horizontalEdges.equalToSuperview().inset(16.0)
    }

    lottie.snp.makeConstraints {
      $0.top.equalTo(label.snp.bottom).inset(100)
      $0.horizontalEdges.equalToSuperview().inset(16.0)
      $0.bottom.equalToSuperview()
    }

    lottie.play()
  }
}
