//
//  Map.Presenter.swift
//  CityDiscover
//
//  Created Даниил Пасилецкий on 26.03.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import CoreLocation

extension Map {

  final class Presenter: NSObject {

    // MARK: - Properties

    weak var view: MapViewInput?
    var router: MapRouterInput?
    var interactor: MapInteractorInput?
    private let locationManager = CLLocationManager()
  }
}

// MARK: - AppendViewOutput

extension Map.Presenter: MapViewOutput {
  func regionDidChange(up: CLLocationCoordinate2D, down: CLLocationCoordinate2D) {
    interactor?.start(mapBox: .init(up: .init(up), down: .init(down)))
  }
  

  func viewDidLoad() {
    locationManager.delegate = self

    if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
      locationManager.startUpdatingLocation()
    } else {
      locationManager.requestWhenInUseAuthorization()
    }
  }

  func close() {
    router?.close()
  }
}

extension Map.Presenter: MapInteractorOutput {
  func show(pins: [PlaceMap]) {
    view?.show(pins: pins)
  }
}

extension Map.Presenter: CLLocationManagerDelegate {
  private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    switch status {
    case .notDetermined:
      print("NotDetermined")
    case .restricted:
      print("Restricted")
    case .denied:
      print("Denied")
    case .authorizedAlways:
      print("AuthorizedAlways")
    case .authorizedWhenInUse:
      print("AuthorizedWhenInUse")
      locationManager.startUpdatingLocation()
    }
  }


  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location = locations.first!
    locationManager.stopUpdatingLocation()
    view?.setCeneter(location: location)
  }

  private func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    print("Failed to initialize GPS: ", error.description)
  }
}
