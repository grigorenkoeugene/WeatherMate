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
        
        static var background = UIColor(hexString: "#F2F2F2")
        
        static var weatherInfoViewBackground = UIColor(hexString: "#195BD1")
        
        static var sunriseSunset = UIColor(hexString: "#3D5865")
        static var timeSunriseSunset = UIColor(hexString: "#002942")
        
        static var thirdColor = UIColor(hexString: "#6692A6")

    }
    
    enum Strings {
        enum TabBar {
            static let weather = "Погода"
            static let time = "Календарь"
            static let map = "Карта"
            static let setting = "Настройки"
        }
        enum Weather {
            static let precipitation = "Вероятность осадков"
            static let lightDay = "Световой день"
        }
        enum DateWeather {
            static let winter = "Ветер"
            static let wet = "Влажность"
            static let pressure = "Давление"
        }
    }
    
    
    
    enum Images {
        static var weatherActive = UIImage(named: "weatherActive")
        static var weatherInactive = UIImage(named: "weatherInActive")

        static var timeActive = UIImage(named: "timeActive")
        static var timeInactive = UIImage(named: "timeInActive")

        static var mapActive = UIImage(named: "mapActive")
        static var mapInactive = UIImage(named: "mapInActive")

        static var settingActive = UIImage(named: "settingActive")
        static var settingInactive = UIImage(named: "settingInActive")
        
        static var winter = UIImage(named: "winterImage")
        static var wet = UIImage(named: "dropView")
        static var pressure = UIImage(named: "pressureView")


    }
    
}
