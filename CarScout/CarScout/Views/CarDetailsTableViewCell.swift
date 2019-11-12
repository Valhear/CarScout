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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with car: Car) {
        let imageURL = URL(string: car.carImageUrl)
        carImage.setImage(with: imageURL)
        
        make.text = car.make
        modelName.text = car.modelName
        fuelType.text = car.fuelType
        fuelLevel.text = "\(car.fuelLevel)"
        transmission.text = car.transmission
    }

}

extension UIImageView {
    func setImage(with url: URL?) {
        guard let imageURL = url else {
            image = UIImage(named: "defaultCarImage")
            
            return
        }
        sd_setImage(with: imageURL, placeholderImage: UIImage(named: "defaultCarImage"), options: .scaleDownLargeImages, context: nil)
    }
}
