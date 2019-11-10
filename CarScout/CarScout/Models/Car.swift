//
//  Car.swift
//  CarScout
//
//  Created by Valentina Henao on 9/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation
import MapKit

struct Car: Codable {
    var id: String
    var modelIdentifier: String
    var modelName: String
    var name: String
    var make: String
    
    var latitude: Double
    var longitude: Double
    
    var carImageUrl: String
}
