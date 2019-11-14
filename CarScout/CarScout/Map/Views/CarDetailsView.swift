//
//  CarDetailsView.swift
//  CarScout
//
//  Created by Valentina Henao on 12/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation
import DrawerView

/// The View to be shown over the Map containing the details of the selected Car Pin
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
    
    /// Delegate in charge of presentation action triggered from this view
    var carDetailsPresenter: CarDetailsPresenter?
    
    /// Button action that triggers the presentation of the Car List
    @IBAction func showCarList(_ sender: UIButton) {
        carDetailsPresenter?.showCarListTableViewController()
    }
    
    /// Configures the current view with the given View Model
    /// - Parameter car: Car View Model object containing the visual representation properties related to this view
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


