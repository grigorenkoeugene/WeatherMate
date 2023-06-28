//
//  WeatherAllData.swift
//  WeatherMate
//
//  Created by admin on 25.06.2023.
//

import Foundation

class WeatherAllDataViewModel {
    private var weatherDetails: [WeatherDetails] = []
    private let requestServer = RequestServer()
    
    func fetchWeatherData(completion: @escaping (Error?) -> Void) {
        requestServer.fetchWeatherData { [weak self] weatherData, error in
            if let weatherData = weatherData {
                self?.weatherDetails.append(contentsOf: weatherData)
                completion(nil)
            } else {
                completion(error)
            }
        }
    }
    func getWeatherDetails() -> [WeatherDetails] {
        return weatherDetails
    }
}
