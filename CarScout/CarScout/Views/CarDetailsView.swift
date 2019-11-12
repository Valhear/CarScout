//
//  CarDetailsView.swift
//  CarScout
//
//  Created by Valentina Henao on 12/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation
import DrawerView

class CarDetailsView: UIView {
    @IBOutlet weak var make: UILabel!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var license: UILabel!
    @IBOutlet weak var cleanliness: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var fuelType: UILabel!
    @IBOutlet weak var fuelLevel: UILabel!
    @IBOutlet weak var transmission: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    //TODO:Add property car Image URL
    
    func configure(with car: Car) {
        let imageURL = URL(string: car.carImageUrl)
        
        make.text = car.make
        modelName.text = car.modelName
        license.text = car.licensePlate
        cleanliness.text = car.innerCleanliness
        name.text = car.name
        fuelType.text = car.fuelType
        fuelLevel.text = "\(car.fuelLevel)"
        transmission.text = car.transmission
        carImage.setImage(with: imageURL)
        
    }
    
}


