//
//  UIImageView_Extensions.swift
//  CarScout
//
//  Created by Valentina Henao on 14/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    /// Sets the image from a given url
    func setImage(with url: URL?) {
        guard let imageURL = url else {
            image = UIImage(named: Car.PropertyKeys.defaultImageName)
            
            return
        }
        sd_setImage(with: imageURL, placeholderImage: UIImage(named: "defaultCarImage"), options: .scaleDownLargeImages, context: nil)
    }
}
