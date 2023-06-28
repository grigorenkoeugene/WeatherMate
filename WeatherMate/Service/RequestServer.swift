//
//  RequestServer.swift
//  WeatherMate
//
//  Created by admin on 21.06.2023.
//

import Foundation

final class RequestServer {

    func fetchWeatherData(completion: @escaping ([WeatherDetails]?, Error?) -> Void) {
        var weatherData: [WeatherDetails] = []

        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=Minsk&appid=a32bc224e02a902fd0e809e4d0d10dd0") else {
            completion(nil, NSError(domain: "Ошибка создания URL", code: 0, userInfo: nil))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            let decoder = JSONDecoder()
            do {
                let weatherResponse = try decoder.decode(WeatherData.self, from: data)
                weatherData.append(contentsOf: weatherResponse.list)
                completion(weatherData, nil)
            } catch let error {
                completion(nil, error)
            }
        }.resume()
    }
}

