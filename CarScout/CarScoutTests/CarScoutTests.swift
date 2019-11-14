//
//  CarScoutTests.swift
//  CarScoutTests
//
//  Created by Valentina Henao on 8/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import XCTest
@testable import CarScout

class CarScoutTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    // Test for instanitating Home View Controller
    func testHomeScreen() {
        var mainStoryboard: UIStoryboard!
        mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let homeVC = mainStoryboard.instantiateViewController(identifier: "HomeVC")
        XCTAssertNotNil(homeVC, "Unable to instantiate HomeViewController")
    }

    // Test for instanitating Car List View Controller
    func testCarListScreen() {
        var carListStoryboard: UIStoryboard!
        carListStoryboard = UIStoryboard(name: "CarList", bundle: nil)
        
        let homeVC = carListStoryboard.instantiateViewController(identifier: "CarListViewController")
        XCTAssertNotNil(homeVC, "Unable to instantiate CarListViewController")
    }
}
