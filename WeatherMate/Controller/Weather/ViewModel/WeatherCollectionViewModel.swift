//
//  WeatherColectionViewModel.swift
//  WeatherMate
//
//  Created by admin on 23.06.2023.
//

import Foundation

class WeatherCollectionViewModel {
    
    var weatherData: [WeatherDetails] = []
    var lastPrintedTimeWeather: String = ""

    var timeWeather: String = "2" {
        didSet {
            // Выполните здесь любую необходимую логику при изменении значения timeWeather
            print("Новое значение timeWeather: \(timeWeather)")
            lastPrintedTimeWeather = timeWeather
        }
    }
    func setWeatherData(_ weatherDetails: [WeatherDetails]) {
        self.weatherData = weatherDetails
        self.timeWeather = calculateTimeWeather()

    }

    private func calculateTimeWeather() -> String {
        guard let pressure = weatherData.first?.main.pressure else {
            return "1"
        }
        return "\(String(describing: Int(pressure))) мм рт.ст."
    }
}
