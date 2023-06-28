//
//  WeatherData.swift
//  WeatherMate
//
//  Created by admin on 21.06.2023.
//

import Foundation

struct WeatherData: Codable {
    let cod: String
    let message, cnt: Int
    let list: [WeatherDetails]
}

// MARK: - WeatherDetails
struct WeatherDetails: Codable {
    let dt: Int
    let main: MainClass
    let weather: [WeeatherType]
    let wind: Wind
    let visibility: Int
    let pop: Double
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, wind, visibility, pop
        case dtTxt = "dt_txt"
    }
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

struct WeeatherType: Codable {
    let id: Int
    let main: String
    let description: String
}
