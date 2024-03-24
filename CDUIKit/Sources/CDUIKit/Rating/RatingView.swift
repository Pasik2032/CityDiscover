//
//  RatingView.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import UIKit

public final class RatingView: UIView {
  public lazy var label: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 15.0)
    label.textColor = .ds(.text)
    return label
  }()

  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "star.circle")
    return imageView
  }()

  public init() {
    super.init(frame: .zero)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func setup(_ rating: Float) {
    label.text = String(format: "%.2f", rating)
    switch rating {
    case 0...3: imageView.tintColor = .systemRed
    case 3...4: imageView.tintColor = .systemOrange
    case 4...10: imageView.tintColor = .systemGreen
    default: imageView.tintColor = .ds(.text)
    }
  }

  private func setupUI() {
    addSubviews([imageView, label])
    self.layer.cornerRadius = 5.0
    self.backgroundColor = .ds(.mainBackground2).withAlphaComponent(0.5)
    imageView.snp.makeConstraints {
      $0.size.equalTo(25.0)
      $0.top.bottom.leading.equalToSuperview().inset(5.0)
    }

    label.snp.makeConstraints {
      $0.centerY.equalTo(imageView)
      $0.leading.equalTo(imageView.snp.trailing).inset(-5.0)
      $0.trailing.equalToSuperview().inset(5.0)
    }
  }
}
