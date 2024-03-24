//
//  PaddingLabel.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import UIKit

public class PaddingLabel: UILabel {

  public var topInset: CGFloat = 5.0
  public var bottomInset: CGFloat = 5.0
  public var leftInset: CGFloat = 7.0
  public var rightInset: CGFloat = 7.0

  public override func drawText(in rect: CGRect) {
    let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    super.drawText(in: rect.inset(by: insets))
  }

  public override var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    return CGSize(
      width: size.width + leftInset + rightInset,
      height: size.height + topInset + bottomInset
    )
  }

  public override var bounds: CGRect {
    didSet {
      preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
    }
  }
}
