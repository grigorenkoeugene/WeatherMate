//
//  UILabel.swift
//  WeatherMate
//
//  Created by admin on 07.06.2023.
//

import UIKit

extension UILabel {
    convenience init(font: CGFloat, textColor: UIColor) {
        self.init()
        self.font = self.font.withSize(font)
        self.textColor = textColor
    }
}
