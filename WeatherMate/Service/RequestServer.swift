//
//  RequestServer.swift
//  WeatherMate
//
//  Created by admin on 21.06.2023.
//

import Foundation

final class RequestServer {
    let myKey = "90785f7daa14451b97f145100232806"
    let city = "minsk"
    func fetchWeatherData(completion: @escaping (Welcome?, Error?) -> Void) {
            guard let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=\(myKey)&q=\(city)&days=2") else {
                let error = NSError(domain: "Invalid URL", code: 0, userInfo: nil)
                completion(nil, error)
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                guard let data = data else {
                    let error = NSError(domain: "No data", code: 0, userInfo: nil)
                    completion(nil, error)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let weatherData = try decoder.decode(Welcome.self, from: data)
                    completion(weatherData, nil)
                } catch {
                    completion(nil, error)
                }
            }
            
            task.resume()
        }
}
