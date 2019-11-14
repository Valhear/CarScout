//
//  NetworkHandlerTests.swift
//  CarScoutTests
//
//  Created by Valentina Henao on 14/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import XCTest
@testable import CarScout

class NetworkHandlerTests: XCTestCase {
    var networkHandler: NetworkHandler?
    
    override func setUp() {
        networkHandler = NetworkHandler()
    }

    override func tearDown() {
    }

    // Test the car list Network request
     func testCarListRequest() {
        networkHandler?.getCarList(success: { carList in
            XCTAssertNotNil(carList)
        }, failure: { error in
            XCTFail("Error performing the request.")
        })
    }
    
    func testDecodeDataResponse() {
        guard let filePath = Bundle.main.url(forResource: "CarListTestData", withExtension: "json") else { return }
        
        let data = try! Data(contentsOf: filePath)
        let carList = networkHandler?.decode(dataResponse: data)
        XCTAssertNotNil(carList)
    }
}
