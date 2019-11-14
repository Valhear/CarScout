//
//  Car.swift
//  CarScout
//
//  Created by Valentina Henao on 9/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation
import MapKit

public struct Car: Codable {
    
    public enum PropertyKeys {
        static let defaultImageName = "defaultCarImage"
    }
    
    var id: String
    var modelIdentifier: String
    var modelName: String
    var name: String
    var make: String
    var group: String
    var color: String
    var series: String
    var fuelType: String
    var fuelLevel: Double
    var transmission: String
    var licensePlate: String
    var latitude: Double
    var longitude: Double
    var innerCleanliness: String
    var carImageUrl: String
}
