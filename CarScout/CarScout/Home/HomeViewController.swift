//
//  HomeViewController.swift
//  CarScout
//
//  Created by Valentina Henao on 8/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import UIKit
import MapKit
import DrawerView

class HomeViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var showListButton: UIButton!
    @IBOutlet var carDetailView: DrawerView!
    
    @IBAction func showCarList(_ sender: UIButton) {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        present(vc, animated: true, completion: nil)
    }
    
    let regionRadius: CLLocationDistance = 5000
    let initialLocation = CLLocation(latitude: 48.134557, longitude: 11.576921)
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        centerMapOnLocation(location: initialLocation)
        updateCarList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showDetailsVC()
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func updateCarList() {
        let networkHandler = NetworkHandler()
        let cars = networkHandler.getCarList()
        let annotations = cars.map { CarPin(car: $0) }
        
        mapView.addAnnotations(annotations)
    }
    
    func showDetailsVC() {
        carDetailView.snapPositions = [.collapsed, .partiallyOpen]
    }
}

