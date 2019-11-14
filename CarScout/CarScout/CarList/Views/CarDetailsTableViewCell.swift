//
//  CarDetailsTableViewCell.swift
//  CarScout
//
//  Created by Valentina Henao on 12/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import UIKit
import SDWebImage

class CarDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var make: UILabel!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var fuelType: UILabel!
    @IBOutlet weak var fuelLevel: UILabel!
    @IBOutlet weak var transmission: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// Configures the current Cell with the given View Model
    /// - Parameter car: Car View Model object containing the visual representation properties related to this view
    func configure(with car: CarViewModel) {
        carImage.setImage(with: car.carImageUrl)
        
        make.text = car.make
        modelName.text = car.modelName
        fuelType.text = car.fuelType
        fuelLevel.text = car.fuelLevel
        transmission.text = car.transmission
    }
}
