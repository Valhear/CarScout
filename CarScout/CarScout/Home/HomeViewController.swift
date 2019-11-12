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

    let regionRadius: CLLocationDistance = 5000
    let initialLocation = CLLocation(latitude: 48.134557, longitude: 11.576921)
    
    var carList = [Car]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var showListButton: UIButton!
    @IBOutlet var carDetailView: CarDetailsView!
    
    @IBAction func showCarList(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let carListVC = storyboard.instantiateViewController(withIdentifier: "CarListViewController") as? CarListViewController else { return }
        carListVC.carList = carList
        
        present(carListVC, animated: true, completion: nil)
    }
    
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
        networkHandler.getCarList { [weak self] cars in
            guard let strongSelf = self else { return }
            strongSelf.carList = cars
            let annotations = cars.map { CarPin(car: $0) }
            
            DispatchQueue.main.async {
                strongSelf.mapView.addAnnotations(annotations)
            }
        }
    }
    
    func showDetailsVC() {
        let drawerView = DrawerView()
           drawerView.attachTo(view: self.view)
        
        drawerView.snapPositions = [.collapsed, .partiallyOpen]
        drawerView.overlayVisibilityBehavior = .disabled
        drawerView.partiallyOpenHeight = 300
        carDetailView.frame = drawerView.bounds

        drawerView.addSubview(carDetailView)
    }
}

