//
//  WrappedView.swift
//
//
//  Created by Даниил Пасилецкий on 01.02.2024.
//

import UIKit

public class WrappedView: UIView {

  private (set) var view: UIView!

  init(view: UIView) {
    self.view = view
    view.backgroundColor = .clear
    super.init(frame: CGRect.zero)
    addSubview(view)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  public override func layoutSubviews() {
    super.layoutSubviews()
    view.frame = bounds
  }
}
