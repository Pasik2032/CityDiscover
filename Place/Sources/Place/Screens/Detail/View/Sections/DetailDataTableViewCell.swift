//
//  DetailDataTableViewCell.swift
//  
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import CDUIKit
import UIKit

protocol DetailDataDelegate: AnyObject {
  func mapDidPressed()
}

final class DetailDataTableViewCell: UITableViewCell {

  private lazy var ratingView: RatingView = {
    let ratingView = RatingView()
    ratingView.label.font = .boldSystemFont(ofSize: 25.0)
    return ratingView
  }()

  private lazy var counterLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15.0)
    label.textColor = .ds(.text)
    label.textAlignment = .center
    return label
  }()

  private lazy var adressLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 12.0)
    label.textColor = .ds(.text)
    label.numberOfLines = 0
    label.text = "Построить маршрут"
    label.textAlignment = .center
    return label
  }()

  private lazy var routeImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "map.circle.fill")
    imageView.tintColor = .ds(.text)
    return imageView
  }()

  private lazy var leftBackView: UIView = {
    let view = UIView()
    view.backgroundColor = .ds(.mainBackground2)
    view.layer.cornerRadius = 15.0
    return view
  }()

  private lazy var rightBackView: UIView = {
    let view = UIView()
    view.backgroundColor = .ds(.mainBackground2)
    view.layer.cornerRadius = 15.0
    let tap = UITapGestureRecognizer(target: self, action: #selector(leftDidPressed))
    view.addGestureRecognizer(tap)
    return view
  }()

  weak var output: DetailDataDelegate?

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    selectionStyle = .none
    backgroundColor = .clear
    contentView.addSubviews([leftBackView, rightBackView])
    leftBackView.addSubviews([ratingView, counterLabel])
    rightBackView.addSubviews([routeImageView, adressLabel])

    let width = UIScreen.main.bounds.width / 2 - 24

    leftBackView.snp.makeConstraints {
      $0.leading.equalToSuperview().inset(16.0)
      $0.width.equalTo(width)
      $0.top.bottom.equalToSuperview().inset(8.0)
    }

    rightBackView.snp.makeConstraints {
      $0.trailing.equalToSuperview().inset(16.0)
      $0.width.equalTo(width)
      $0.top.bottom.equalToSuperview().inset(8.0)
    }

    routeImageView.snp.makeConstraints {
      $0.size.equalTo(50.0)
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().inset(8.0)
    }

    adressLabel.snp.makeConstraints {
      $0.top.equalTo(routeImageView.snp.bottom).inset(-8.0)
      $0.leading.trailing.equalToSuperview().inset(16.0)

    }

    ratingView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().inset(8.0)
    }

    counterLabel.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.top.equalTo(ratingView.snp.bottom).inset(-8.0)
      $0.bottom.equalToSuperview().inset(16.0)
    }
  }

  func setup(rating: Float, counter: String) {
    counterLabel.text = counter
    ratingView.setup(rating)
  }

  @objc private func leftDidPressed() {
    output?.mapDidPressed()
  }
}
