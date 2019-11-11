//
//  CarPin.swift
//  CarScout
//
//  Created by Valentina Henao on 9/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation
import MapKit

class CarPin: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
  
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    
        super.init()
    }
}

extension CarPin {
    convenience init(car: Car) {
        let carCoordinate = CLLocationCoordinate2D(latitude: car.latitude, longitude: car.longitude)
        self.init(title: car.make, subtitle: car.modelName, coordinate:carCoordinate)
    }
}
