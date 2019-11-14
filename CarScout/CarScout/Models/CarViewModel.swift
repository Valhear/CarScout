//
//  CarViewModel.swift
//  CarScout
//
//  Created by Valentina Henao on 14/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation
import MapKit

public class CarViewModel {
    private let car: Car

    public init(car: Car) {
        self.car = car
    }
    
    /// String representation for "modelName"
    public var modelName: String {
        return car.modelName
    }
    
    /// String representation for "name"
    public var name: String {
        return car.name
    }
    
    /// String representation for "make"
    public var make: String {
        return car.make
    }
    
    /// String representation for "fuelType"
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
    
    /// String representation for "fuelLevel"
    public var fuelLevel: String  {
        return String(round(car.fuelLevel * 100)) + "%"
    }
    
    
    /// String representation for "transmission"
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
    
    /// String representation for "licensePlate"
    public var licensePlate: String {
        return car.licensePlate
    }
    
    
    /// CLLocation representation for  car "latitude" and "longitude"
    public var location: CLLocation {
        return CLLocation(latitude: car.latitude, longitude: car.longitude)
    }
        
    /// Color representation for  car "innerCleanliness"
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
    
    /// URL representation for "carImageURL"
    public var carImageUrl: URL? {
        return URL(string: car.carImageUrl)
    }
}
