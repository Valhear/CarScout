//
//  HomeViewController.swift
//  CarScout
//
//  Created by Valentina Henao on 8/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    let initialLocation = CLLocation(latitude: 48.134557, longitude: 11.576921)
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        centerMapOnLocation(location: initialLocation)
        updateCarList()
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func updateCarList() {
        let networkHandler = NetworkHandler()
        let cars = networkHandler.getCarList()
        let annotations = cars.map { $0.annotation }
        
        mapView.addAnnotations(annotations)
        
        // show single pin on map
        let carPin = CarPin(title: "BMW", subtitle: "MINI", coordinate: CLLocationCoordinate2D(latitude: 48.134557, longitude: 11.576921))
        mapView.addAnnotation(carPin)
    }
}
