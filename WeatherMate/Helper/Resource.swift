//
//  Resource.swift
//  WeatherMate
//
//  Created by admin on 31.05.2023.
//

import UIKit

enum Resource {
    enum Color {
        static var active = UIColor(hexString: "#2556BF")
    }
    
    enum Strings {
        enum TabBar {
            static var weather = "Погода"
            static var calendar = "Календарь"
            static var map = "Карта"
            static var settings = "Настройки"
        }
    }
    
    enum Images {
        static var weather = UIImage(named: "asf")
        static var calendar = UIImage(named: "asf")
        static var map = UIImage(named: "asf")
        static var settings = UIImage(named: "asf")
    }
}
