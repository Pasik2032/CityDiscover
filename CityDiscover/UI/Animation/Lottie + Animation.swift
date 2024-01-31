//
//  Lottie + Animation.swift
//  CityDiscover
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

import Lottie

extension LottieAnimationView {
  convenience init(_ animation: Animation) {
    print("animation.value \(Mode.shared.current) \(animation.value)")
    self.init(name: animation.value)
  }
}
