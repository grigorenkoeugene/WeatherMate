//
//  BaseController.swift
//  WeatherMate
//
//  Created by admin on 05.06.2023.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}

extension BaseController {
    func configureAppearance() {
        view.backgroundColor = Resource.Color.background
    }
    func setupViews() {}
}
