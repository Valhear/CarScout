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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Test the car search JSON results mapping
     func testCarListMapping() {
        let decoder = JSONDecoder()
        
        guard let filePath = Bundle.main.url(forResource: "carList", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: filePath)
            let carList = try [decoder.decode([Car].self, from: data)]
            XCTAssertNotNil(carList)
        } catch {
            XCTFail("Unable to map car items.")
        }
    }
}
