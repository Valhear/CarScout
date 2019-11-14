//
//  CarListDatasourceTests.swift
//  CarScoutTests
//
//  Created by Valentina Henao on 14/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import XCTest
@testable import CarScout

class CarListDatasourceTests: XCTestCase {
    var testCars: [Car]?
    
    override func setUp() {
        let networkHandler = NetworkHandler()
        var data = Data()
        JsonLoader.loadJSON(fromFileName: "CarListTestData", intoDataObject: &data)
        testCars = networkHandler.decode(dataResponse: data)
        
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateDatasourceObject() {
        let datasource = CarListDataSource(carItems: testCars!)
        XCTAssertNotNil(datasource)
    }

    func testDatasourceNumberOfSections() {
        let datasource = CarListDataSource(carItems: testCars!)
        let sections = datasource.numberOfSections()
        XCTAssertEqual(sections, 1)
    }
    
    func testDatasourceNumberOfCarItems() {
        let datasource = CarListDataSource(carItems: testCars!)
        let numberOfCarItems = datasource.numberOfCarItems()
        XCTAssertEqual(numberOfCarItems, 28)
    }
    
    func testDatasourceItemAtIndex() {
        let datasource = CarListDataSource(carItems: testCars!)
        let item = datasource.item(at: IndexPath(row: 0, section: 0))!
        XCTAssertEqual(String(describing: type(of: item)), "CarViewModel")
    }
}
