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
        
    func configure(with car: CarViewModel) {        
        make.text = car.make
        modelName.text = car.modelName
        license.text = car.licensePlate
        cleanliness.tintColor = car.innerCleanliness
        name.text = car.name
        fuelType.text = car.fuelType
        fuelLevel.text = car.fuelLevel
        transmission.text = car.transmission
        carImage.setImage(with: car.carImageUrl)
    }
}


