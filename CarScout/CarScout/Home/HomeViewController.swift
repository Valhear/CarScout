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

protocol CarDetailsProvider {
    var carList: [Car] { get }
    func showCarDetails(carObject: Car)
    func showCarListTableViewController()
}

class HomeViewController: UIViewController {
    let regionRadius: CLLocationDistance = 5000
    let initialLocation = CLLocation(latitude: 48.134557, longitude: 11.576921)
    
    var carList = [Car]()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var carDetailView: CarDetailsView!
    let drawerView = DrawerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        centerMapOnLocation(location: initialLocation)
        updateCarList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupDrawerView()
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func updateCarList() {
        let networkHandler = NetworkHandler()
        networkHandler.getCarList(success: { [weak self] cars in
            guard let strongSelf = self else { return }
            guard let cars = cars else { return }
            
            strongSelf.carList = cars
            let annotations = cars.map { CarAnnotation(car: $0) }
            
            DispatchQueue.main.async {
                strongSelf.mapView.addAnnotations(annotations)
            }
        }, failure: { [weak self] error in
            guard let strongSelf = self else { return }
            guard let error = error else { return }
                        
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error downloading the car data", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in } ))
                strongSelf.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    private func setupDrawerView() {
        drawerView.attachTo(view: self.view)
        drawerView.snapPositions = [.collapsed, .partiallyOpen]
        drawerView.overlayVisibilityBehavior = .disabled
        drawerView.partiallyOpenHeight = 300
        drawerView.collapsedHeight = 20
        
        carDetailView.frame = drawerView.bounds
        carDetailView.carDetailsProvider = self
        drawerView.addSubview(carDetailView)
    }
}

// MARK: - MKMapViewDelegate
extension HomeViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let pinSelected = view.annotation as! CarAnnotation
        let location = CLLocation(latitude: pinSelected.coordinate.latitude, longitude: pinSelected.coordinate.longitude)
        
        centerMapOnLocation(location: location)
        
        let carViewModel = CarViewModel(car: pinSelected.carItem)
        carDetailView.configure(with: carViewModel)
        
        drawerView.setPosition(.partiallyOpen, animated: true)
    }
}

extension HomeViewController: CarDetailsProvider {
    func showCarDetails(carObject: Car) {
        dismiss(animated: true, completion: nil)
        
        let carViewModel = CarViewModel(car: carObject)
        carDetailView.configure(with: carViewModel)
        
        drawerView.setPosition(.partiallyOpen, animated: true)
        centerMapOnLocation(location: carViewModel.location)
    }
    
    func showCarListTableViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let carListVC = storyboard.instantiateViewController(withIdentifier: "CarListViewController") as? CarListViewController else { return }
        carListVC.carDetailsProvider = self
                
        present(carListVC, animated: true, completion: nil)
    }
}
