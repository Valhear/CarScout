//
//  CarAnnotation.swift
//  CarScout
//
//  Created by Valentina Henao on 9/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation
import MapKit

class CarAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    let carItem: Car
  
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D, carItem: Car) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.carItem = carItem
    
        super.init()
    }
}

extension CarAnnotation {
    convenience init(car: Car) {
        let carCoordinate = CLLocationCoordinate2D(latitude: car.latitude, longitude: car.longitude)
        self.init(title: car.make, subtitle: car.modelName, coordinate:carCoordinate, carItem: car)
    }
}
