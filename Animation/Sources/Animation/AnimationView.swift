//
//  AnimationView.swift
//
//
//  Created by Даниил Пасилецкий on 14.02.2024.
//

import Lottie
import Foundation

public final class AnimationView: LottieAnimationView {
  public convenience init(animation: Animation) {
    self.init(name: animation.value, bundle: .module)
  }

  public convenience init(_ animation: Animation.Static) {
    self.init(animation: animation.animation)
  }
}
