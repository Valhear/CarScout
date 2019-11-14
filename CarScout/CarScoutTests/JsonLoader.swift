//
//  JsonLoader.swift
//  CarScoutTests
//
//  Created by Valentina Henao on 13/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation

class JsonLoader {
    class func loadJSON(fromFileName fileName: String, intoDataObject dataObject: inout Data) {
        if let path = Bundle.main.url(forResource: "CarListTestData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path, options: .mappedIfSafe)
                dataObject = data
            } catch {
                print("Could not load ad cadence data from \(fileName).json")
            }
        }
    }
}
