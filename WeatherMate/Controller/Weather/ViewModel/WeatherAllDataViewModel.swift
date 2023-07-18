//
//  WeatherAllData.swift
//  WeatherMate
//
//  Created by admin on 25.06.2023.
//

import Foundation

class WeatherAllDataViewModel {
    private var weatherDetails: Welcome?
        private let requestServer = RequestServer()
        
    func fetchWeatherData(completion: @escaping (Welcome?, Error?) -> Void) {
        requestServer.fetchWeatherData { [weak self] weatherData, error in
            if let weatherData = weatherData {
                self?.weatherDetails = weatherData
                completion(weatherData, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    func getWeatherDetails() -> Welcome? {
        return weatherDetails
    }
}
