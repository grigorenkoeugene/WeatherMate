//
//  UIView + ext.swift
//  WeatherMate
//
//  Created by admin on 01.06.2023.
//

import UIKit

extension UIView {
    @objc func setupView(_ view: UIView) {
        addSubview(view)
    }
    @objc func setupTable(_ view: UITableView) {
        addSubview(view)
    }
}
