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
    var id: String
    var modelIdentifier: String
    var modelName: String
    var name: String
    var make: String
    var color: String
    var fuelType: String
    var fuelLevel: Double
    var transmission: String
    var licensePlate: String
    var latitude: Double
    var longitude: Double
    var innerCleanliness: String
    var carImageUrl: String
    
    // String representation for "fuelLevel"
    var fuelPercentage: String  {
      return String(round(fuelLevel * 100)) + "%"
    }
    
    // String representation for "fuelType"
    var fuelKind: String  {
      switch fuelType {
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
    
    // String representation for "transmission"
    var transmissionType: String  {
      switch transmission {
      case "M":
        return "Manual"
      case "A":
        return "Automatic"
      default:
        return "Unknown"
      }
    }
    
    // Color representation for "innerCleanliness"
    var cleanliness: UIColor {
        switch innerCleanliness {
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
}
