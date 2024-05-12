//
//  DetailMapTableViewCell.swift
//
//
//  Created by Даниил Пасилецкий on 24.03.2024.
//

import CDUIKit
import UIKit
import MapKit

final class DetailMapTableViewCell: UITableViewCell {

  private lazy var mapKit: MKMapView = {
    let mapKit = MKMapView()
    mapKit.layer.cornerRadius = 20.0
    return mapKit
  }()

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
    contentView.addSubview(mapKit)
    mapKit.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.top.bottom.equalToSuperview().inset(8.0)
      $0.height.equalTo(300.0)
    }
  }

  func setup(coordinate: Coordinate) {
    mapKit.centerToLocation(coordinate.location, regionRadius: 500)
    mapKit.addAnnotation(Pin(coordinate: coordinate.location2D))
  }
}
