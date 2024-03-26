//
//  AppendMapTableViewCell.swift
//
//
//  Created by Даниил Пасилецкий on 26.03.2024.
//

import UIKit
import MapKit

protocol MapDeleagte: AnyObject {
  func mapDidChange(coordinate: Coordinate)
}

final class AppendMapTableViewCell: UITableViewCell {

  private lazy var label: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 15.0)
    label.text = "Геопозиция"
    return label
  }()

  private lazy var mapKit: MKMapView = {
    let mapKit = MKMapView()
    mapKit.layer.cornerRadius = 20.0
    mapKit.showsUserLocation = true
    
    return mapKit
  }()

  private lazy var pinImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "mappin")
    return imageView
  }()

  let locationManager = CLLocationManager()

  weak var delegate: MapDeleagte?

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
    contentView.addSubview(label)
    contentView.addSubview(mapKit)
    mapKit.addSubview(pinImageView)

    let locValue: CLLocationCoordinate2D = locationManager.location!.coordinate
    delegate?.mapDidChange(coordinate: Coordinate(longitude: Float(locValue.longitude), latitude: Float(locValue.latitude)))

    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    let region = MKCoordinateRegion(center: locValue, span: span)
    mapKit.setRegion(region, animated: true)

    pinImageView.snp.makeConstraints {
      $0.height.equalTo(50)
      $0.width.equalTo(50)
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().inset(65)
    }

    label.snp.makeConstraints {
      $0.top.equalToSuperview().inset(30.0)
      $0.leading.trailing.equalToSuperview().inset(16.0)
    }

    mapKit.snp.makeConstraints {
      $0.top.equalTo(label.snp.bottom).inset(-16.0)
      $0.bottom.equalToSuperview()
      $0.leading.trailing.equalToSuperview().inset(16.0)
      $0.height.equalTo(230.0)
    }
  }
}
