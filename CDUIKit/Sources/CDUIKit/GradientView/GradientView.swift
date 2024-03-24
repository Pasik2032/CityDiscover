//
//  GradientView.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import UIKit

public class GradientView: UIView {
  public override class var layerClass: Swift.AnyClass {
    return CAGradientLayer.self
  }
}
