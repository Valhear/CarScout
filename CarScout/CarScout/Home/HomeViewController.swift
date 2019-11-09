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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set initial location
        let initialLocation = CLLocation(latitude: 48.134557, longitude: 11.576921)
        
        centerMapOnLocation(location: initialLocation)
    }

    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
      mapView.setRegion(coordinateRegion, animated: true)
    }
}

