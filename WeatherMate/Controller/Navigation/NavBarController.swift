//
//  NavBarController.swift
//  WeatherMate
//
//  Created by admin on 31.05.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    override func viewDidLoad() {
        configure()
    }
    
    private func configure() {
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
