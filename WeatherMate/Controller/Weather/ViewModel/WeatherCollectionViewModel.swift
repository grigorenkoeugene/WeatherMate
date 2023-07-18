//
//  WeatherColectionViewModel.swift
//  WeatherMate
//
//  Created by admin on 23.06.2023.
//

import Foundation

class WeatherCollectionViewModel {
    
    var weatherData: Welcome?
    var lastPrintedTimeWeather: String = ""

    var timeWeather: String?
    func setWeatherData(_ weatherDetails: Welcome) {
        self.weatherData = weatherDetails
//        self.timeWeather = calculateTimeWeather()
    }

//    private func calculateTimeWeather() -> String {
//        guard let pressure = weatherData?.current.tempC else {
//            return "1"
//        }
//        return "\(String(describing: Int(pressure))) мм рт.ст."
//    }
}
