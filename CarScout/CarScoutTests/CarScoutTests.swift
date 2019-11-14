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

    var storyboard: UIStoryboard!
    
    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testHomeScreen() {
        let homeVC = storyboard.instantiateViewController(identifier: "HomeVC")
        XCTAssertNotNil(homeVC, "Unable to instantiate HomeViewController")
    }

    func testCarListScreen() {
        let homeVC = storyboard.instantiateViewController(identifier: "CarListViewController")
        XCTAssertNotNil(homeVC, "Unable to instantiate CarListViewController")
    }
}
