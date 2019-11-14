//
//  CarViewModel.swift
//  CarScout
//
//  Created by Valentina Henao on 14/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation
import MapKit

/// Represents a Car View Model Object containing the visual representations of the Car Properties that need to be displayed in Views.
public class CarViewModel {
    private let car: Car

    /// Creates an instance of a CarViewModel from a given Car Object
    public init(car: Car) {
        self.car = car
    }
    
    /// String representation for "modelName" property
    public var modelName: String {
        return car.modelName
    }
    
    /// String representation for "name" property
    public var name: String {
        return car.name
    }
    
    /// String representation for "make" property
    public var make: String {
        return car.make
    }
    
    /// String representation for "fuelType" property
    public var fuelType: String {
        switch car.fuelType {
        case "D":
          return "Diesel"
        case "P":
          return "Petrol"
        case "E":
          return "Ethanol"
        default:
          return "Unknown"
        }
    }
    
    /// String representation for "fuelLevel" property
    public var fuelLevel: String  {
        return String(round(car.fuelLevel * 100)) + "%"
    }
    
    
    /// String representation for "transmission" property
    public var transmission: String  {
        switch car.transmission {
        case "M":
            return "Manual"
        case "A":
            return "Automatic"
        default:
            return "Unknown"
        }
    }
    
    /// String representation for "licensePlate" property
    public var licensePlate: String {
        return car.licensePlate
    }
    
    
    /// CLLocation representation for car "latitude" and "longitude" properties
    public var location: CLLocation {
        return CLLocation(latitude: car.latitude, longitude: car.longitude)
    }
        
    /// Color representation for  car "innerCleanliness" property
    public var innerCleanliness: UIColor {
        switch car.innerCleanliness {
        case "REGULAR":
            return .orange
        case "CLEAN":
            return .yellow
        case "VERY_CLEAN":
            return .green
        default:
            return .green
        }
    }
    
    /// The URL for this item image
    public var carImageUrl: URL? {
        return URL(string: car.carImageUrl)
    }
}
