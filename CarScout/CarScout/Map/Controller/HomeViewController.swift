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

/// Set of methods called in response to the delegated presenting actions.
protocol CarDetailsPresenter {
    /// Method called to show the Car Details of the given Car Object
    func showCarDetails(carItem: CarViewModel?)
    
    /// Method called to show the list of cars available
    func showCarListTableViewController()
}

/// Represents the Main view controller where the Car Object are visually displayed in a Map through Pins
class HomeViewController: UIViewController {
    enum InitialLocation {
        static let regionRadius: CLLocationDistance = 5000
        static let geoLocation = CLLocation(latitude: 48.134557, longitude: 11.576921)
    }
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var carDetailView: CarDetailsView!
    
    var carList = [Car]()
    let drawerView = DrawerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        centerMapOnLocation(location: InitialLocation.geoLocation)
        updateCarList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupDrawerView()
    }
    
    // MARK: - Populate data
    
    /// Retrieve the List of cars from the network
    private func updateCarList() {
        let networkHandler = NetworkHandler()
        
        let successBlock: DownloadSuccess = { [weak self] cars in
            guard let strongSelf = self else { return }
            guard let cars = cars else { return }
            
            strongSelf.carList = cars
            let annotations = cars.map { CarAnnotation(car: $0) }
            
            DispatchQueue.main.async {
                strongSelf.mapView.addAnnotations(annotations)
            }
        }
        
        let failureBlock: DownloadFailure = { [weak self] error in
            guard let strongSelf = self else { return }
            guard let error = error else { return }
                        
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error downloading the car data", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                strongSelf.present(alert, animated: true, completion: nil)
            }
        }
        
        networkHandler.getCarList(success: successBlock, failure: failureBlock)
    }
    
    // MARK: - Car Selection
    
    /// Performs basic configuration when a Car is selected
    private func selectCarForDetails(carSelected: CarViewModel) {
        carDetailView.configure(with: carSelected)
        drawerView.setPosition(.partiallyOpen, animated: true)
        centerMapOnLocation(location: carSelected.location)
    }
    
    /// Prepares the DrawerView that contains the Details for the selected Car
    private func setupDrawerView() {
        drawerView.attachTo(view: self.view)
        drawerView.snapPositions = [.collapsed, .partiallyOpen]
        drawerView.overlayVisibilityBehavior = .disabled
        drawerView.partiallyOpenHeight = 300
        drawerView.collapsedHeight = 20
        
        carDetailView.frame = drawerView.bounds
        carDetailView.carDetailsPresenter = self
        drawerView.addSubview(carDetailView)
    }
    
    /// Moves the map and centers on given location
    private func centerMapOnLocation(location: CLLocation) {
        let radius = InitialLocation.regionRadius
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

// MARK: - MKMapViewDelegate

extension HomeViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let pinSelected = view.annotation as? CarAnnotation else { return }
        
        let carViewModel = CarViewModel(car: pinSelected.carItem)
        selectCarForDetails(carSelected: carViewModel)
    }
}

// MARK: - CarDetailsPresenter

extension HomeViewController: CarDetailsPresenter {
    func showCarDetails(carItem: CarViewModel?) {
        dismiss(animated: true, completion: nil)
        
        guard let carItem = carItem else { return }
        
        selectCarForDetails(carSelected: carItem)
        let carCoordinate = carItem.location.coordinate
        let selectedPin = mapView.annotations.first { $0.coordinate.latitude == carCoordinate.latitude && $0.coordinate.longitude == carCoordinate.longitude }
        
        if let annotation = selectedPin {
            mapView.selectAnnotation(annotation, animated: true)
        }
    }
    
    func showCarListTableViewController() {
        let storyboard = UIStoryboard(name: "CarList", bundle: nil)
        
        guard let carListVC = storyboard.instantiateViewController(withIdentifier: "CarListViewController") as? CarListViewController else { return }
        carListVC.carDetailsPresenter = self
        carListVC.carListDataSource = CarListDataSource(carItems: carList)
        
        present(carListVC, animated: true, completion: nil)
    }
}
