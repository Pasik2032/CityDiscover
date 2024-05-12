//
//  Profile.View.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CDUIKit
import MapKit

protocol MapViewInput: AnyObject {
  func setCeneter(location: CLLocation)
  func show(pins: [PlaceMap])
}

protocol MapViewOutput: AnyObject {
  func viewDidLoad()
  func close()
  func regionDidChange(up: CLLocationCoordinate2D, down: CLLocationCoordinate2D)
}

extension Map {
  final class View: ViewController {

    // MARK: - UI

    private lazy var mapView: MKMapView = {
      let map = MKMapView()
      map.showsUserLocation = true
      map.delegate = self
      return map
    }()

    // MARK: - Properties

    var presenter: MapViewOutput?


    // MARK: - UIViewController

    override func viewDidLoad() {
      super.viewDidLoad()
      presenter?.viewDidLoad()
      setupUI()
    }

    // MARK: - Actions

    @objc private func close() {
      presenter?.close()
    }

    // MARK: - Setup

    private func setupUI() {
      title = "Карта интересных мест"
      setupNavBar()
      view.backgroundColor = .ds(.mainBackground)
      view.addSubview(mapView)

      mapView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }

    private func setupNavBar() {
      self.navigationItem.leftBarButtonItem = UIBarButtonItem(
        image: UIImage(systemName: "xmark"),
        style: .plain,
        target: self,
        action: #selector(close)
      )
    }
  }
}

// MARK: - AppendViewInput

extension Map.View: MapViewInput {
  func show(pins: [PlaceMap]) {
    pins.forEach { pin in
      mapView.addAnnotation(pin)
    }
  }
  
  func setCeneter(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: 500,
      longitudinalMeters: 500
    )
    mapView.setRegion(coordinateRegion, animated: true)
  }
}

extension Map.View: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    print("ZOOM finished \(mapView.topLeftCoordinate) \(mapView.bottomRightCoordinate())")
    presenter?.regionDidChange(
      up: mapView.topLeftCoordinate(),
      down: mapView.bottomRightCoordinate()
    )
  }
}

extension MKMapView {
  func topLeftCoordinate() -> CLLocationCoordinate2D {
    return convert(.zero, toCoordinateFrom: self)
  }

  func bottomRightCoordinate() -> CLLocationCoordinate2D {
    return convert(CGPoint(x: frame.width, y: frame.height), toCoordinateFrom: self)
  }
}
