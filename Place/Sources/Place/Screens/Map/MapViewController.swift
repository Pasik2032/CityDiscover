//
//  MapViewController.swift
//
//
//  Created by Даниил Пасилецкий on 26.03.2024.
//

import UIKit
import MapKit
import CoreLocation

public final class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

  private var models: [AppendModel] = UserPlaceService.shared.places

  private lazy var mapView: MKMapView = {
    let mapKit = MKMapView()
    mapKit.layer.cornerRadius = 20.0
    mapKit.showsUserLocation = true
    return mapKit
  }()

  let locationManager = CLLocationManager()

  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    models = UserPlaceService.shared.places
    configMap()
  }

  public override func viewDidLoad() {
    title = "Мои места"
    view.addSubview(mapView)

    mapView.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide)
      $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(16.0)
      $0.leading.trailing.equalToSuperview().inset(16.0)
    }

    self.locationManager.requestAlwaysAuthorization()

    // For use in foreground
    self.locationManager.requestWhenInUseAuthorization()

    if CLLocationManager.locationServicesEnabled() {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.startUpdatingLocation()
    }

    mapView.delegate = self
    mapView.mapType = .standard
    mapView.isZoomEnabled = true
    mapView.isScrollEnabled = true

    if let coor = mapView.userLocation.location?.coordinate{
      mapView.setCenter(coor, animated: true)
    }
    configMap()
  }

  private func configMap() {
    mapView.removeAnnotations(mapView.annotations)
    models.forEach {
      let annotation = MKPointAnnotation()
      annotation.coordinate = $0.coordin?.location2D ?? locationManager.location!.coordinate
      annotation.title = $0.name
      mapView.addAnnotation(annotation)
    }

    let locValue: CLLocationCoordinate2D = locationManager.location!.coordinate


    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    let region = MKCoordinateRegion(center: locValue, span: span)
    mapView.setRegion(region, animated: true)
  }

  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

  }

  public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    guard let model = models.first(where: { $0.coordin?.location2D == view.annotation?.coordinate }) else { return }
    let detail = MapDetailViewController()
    detail.section = [
      .title(title: model.name!, category: "Мои метса"),
      .images(model.image),
      .description(model.description!)
    ]
    navigationController?.pushViewController(detail, animated: true)
  }
}

extension CLLocationCoordinate2D: Equatable {
  public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
  }
}
