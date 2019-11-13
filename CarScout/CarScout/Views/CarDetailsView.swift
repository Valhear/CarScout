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
    @IBOutlet weak var cleanliness: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var fuelType: UILabel!
    @IBOutlet weak var fuelLevel: UILabel!
    @IBOutlet weak var transmission: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    var carDetailsProvider: CarDetailsProvider?
    
    @IBAction func showCarList(_ sender: UIButton) {
        carDetailsProvider?.showCarListTableViewController()
    }
    
    //TODO:Add property car Image URL
    
    func configure(with car: Car) {
        let imageURL = URL(string: car.carImageUrl)
        
        make.text = car.make
        modelName.text = car.modelName
        license.text = car.licensePlate
        cleanliness.tintColor = car.cleanliness
        name.text = car.name
        fuelType.text = car.fuelKind
        fuelLevel.text = car.fuelPercentage
        transmission.text = car.transmissionType
        carImage.setImage(with: imageURL)
    }
}


