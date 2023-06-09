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
        setupViews()
        constraintViews() 
        configureAppearance()
    }

}

@objc  extension BaseController {
    func configureAppearance() {
        view.backgroundColor = Resource.Color.background
    }
    func setupViews() {}
    func constraintViews() {}

}
