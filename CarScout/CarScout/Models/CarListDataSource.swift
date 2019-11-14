//
//  CarListDataSource.swift
//  CarScout
//
//  Created by Valentina Henao on 14/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation

protocol CarListDataSourceProtocol: class {
    func numberOfSections() -> Int
    func numberOfCarItems() -> Int
    func item(at indexPath: IndexPath) -> CarViewModel?
}

class CarListDataSource: CarListDataSourceProtocol {
    private var carList = [CarViewModel]()
    
    init(carItems: [Car]) {
        carItems.forEach { car in
            carList.append(CarViewModel(car: car))
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfCarItems() -> Int {
        return carList.count
    }
    
    func item(at indexPath: IndexPath) -> CarViewModel? {
        let carObject = carList[indexPath.row]

        return carObject
    }    
}
