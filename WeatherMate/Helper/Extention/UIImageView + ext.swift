//
//  UIImageView + ext.swift
//  WeatherMate
//
//  Created by admin on 29.06.2023.
//

import UIKit

extension UIImageView {
    convenience init(named imageName: String) {
        self.init(image: UIImage(named: imageName))
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = .white
        self.contentMode = .scaleAspectFit
    }
}
