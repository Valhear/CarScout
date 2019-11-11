//
//  NetworkHandler.swift
//  CarScout
//
//  Created by Valentina Henao on 9/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation

class NetworkHandler {
    func getCarList() -> [Car] {
        var cars = [Car]()
        
        //TODO: Network Request
        guard let filePath = Bundle.main.url(forResource: "carList", withExtension: "json") else { return cars }
        guard let dataResponse = try? Data(contentsOf: filePath) else { return cars }
        
        //Decode JSON Response Data
        do {
            let decoder = JSONDecoder()
            let carList = try decoder.decode([Car].self, from: dataResponse)
            cars = carList
        } catch let parsingError {
            print("Error", parsingError)
        }
        
        return cars
    }
}
