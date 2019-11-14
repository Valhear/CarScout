//
//  CarModelTests.swift
//  CarScoutTests
//
//  Created by Valentina Henao on 12/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import XCTest
@testable import CarScout

class CarModelTests: XCTestCase {
    var networkHandler: NetworkHandler?
    var testCars: [Car]?
    
    override func setUp() {
        networkHandler = NetworkHandler()
        var data = Data()
        JsonLoader.loadJSON(fromFileName: "CarListTestData", intoDataObject: &data)
        testCars = networkHandler?.decode(dataResponse: data)
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    // Test the car list JSON mapping
     func testCarListMapping() {
        let decoder = JSONDecoder()
        
        guard let filePath = Bundle.main.url(forResource: "CarListTestData", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: filePath)
            let carList = try [decoder.decode([Car].self, from: data)]
            XCTAssertNotNil(carList)
        } catch {
            XCTFail("Unable to get the Car items.")
        }
    }
    
    //Test String representation for "fuelLevel"
    func testFuelLevelMapping() {
        if let car = testCars?.first {
            let carVM = CarViewModel(car: car)
            XCTAssertEqual(carVM.fuelLevel, "70.0%")
        } else {
          XCTFail("Error getting the car object.")
        }
    }
    
    //Test String representation for "fuelType"
    func testFuelTypeMapping() {
        if let car = testCars?.first {
            let carVM = CarViewModel(car: car)
            XCTAssertEqual(carVM.fuelType, "Diesel")
        } else {
          XCTFail("Error getting the car object.")
        }
    }
    
    //Test String representation for "transmission"
    func testTransmissionTypelMapping() {
        if let car = testCars?.first {
            let carVM = CarViewModel(car: car)
            XCTAssertEqual(carVM.transmission, "Manual")
        } else {
          XCTFail("Error getting the car object.")
        }
    }
    
    //Test String representation for "innerCleanliness"
    func testInnerCleanlinessMapping() {
        if let car = testCars?.first {
            let carVM = CarViewModel(car: car)
            XCTAssertEqual(carVM.innerCleanliness, UIColor.orange)
        } else {
          XCTFail("Error getting the car object.")
        }
    }
}

