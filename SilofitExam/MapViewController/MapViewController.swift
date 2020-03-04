//
//  MapViewController.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-01.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import UIKit
import MapKit

protocol MapViewControllerDelegate: class {
    func mapViewControllerDitTapOnListButton(_ controller: MapViewController, spaces: [Space])
    func mapViewControllerDitTapOnLogoutButton(_ controller: MapViewController)
    func mapViewController(_ controller: MapViewController, didSelectSpace spase: Space)
}

class MapViewController: UIViewController, ShowsLoading {

    @IBOutlet weak var mapView: MKMapView!
    
    weak var delegate: MapViewControllerDelegate?

    var spinner: UIActivityIndicatorView?
    var spaces: [Space] = []

    let regionRadius: CLLocationDistance = 1000

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarButtons()
        mapView.delegate = self
        loadAndShowSpacesOnMap()
    }

    func setupNavigationBarButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "List", style: .plain, target: self, action: #selector(showList))
    }

    func loadAndShowSpacesOnMap() {
        showLoadingIndicator()
        Store().getListOfLocation { [weak self] result in
            guard let self = self else { return }
            self.removeLoadingIndicator()
            switch result {
            case .success(let spaces):
                self.spaces = spaces
                self.showSpacesOnMap(spaces)

            case .failure(let error):
                self.showAlert(withTitle: "Error", message: error.localizedDescription)
            }
        }
    }

    func showSpacesOnMap(_ spaces: [Space]) {
        let spaceAnnotations = spaces.compactMap { SpaceMapAnnotation($0) }
        mapView.addAnnotations(spaceAnnotations)
        if let firstSpace = spaceAnnotations.first {
            let coordinate = CLLocation(latitude: firstSpace.coordinate.latitude, longitude: firstSpace.coordinate.longitude)
            centerMapOnLocation(location: coordinate, regionRadius: regionRadius)
        }
    }

    func centerMapOnLocation(location: CLLocation, regionRadius: CLLocationDistance) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @objc func logout() {
        delegate?.mapViewControllerDitTapOnLogoutButton(self)
    }

    @objc func showList() {
        delegate?.mapViewControllerDitTapOnListButton(self, spaces: spaces)
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotations = view.annotation as? SpaceMapAnnotation,
            let space = spaces.first(where: { $0.space_id == annotations.spaceId }) else {
                return
        }
        delegate?.mapViewController(self, didSelectSpace: space)
    }
}
