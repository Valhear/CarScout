//
//  Car.swift
//  CarScout
//
//  Created by Valentina Henao on 9/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation
import MapKit

/// Represents a Car Object, it is a rep
/// This object is capable of being encoded and decoded to/from a serialized format, like JSON
public struct Car: Codable {
    
    /// The name of the image representing the default fallback.
    public enum PropertyKeys {
        static let defaultImageName = "defaultCarImage"
    }
    
    /// Car Properties
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
