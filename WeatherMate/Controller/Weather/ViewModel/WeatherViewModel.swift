//
//  WeatherViewModel.swift
//  WeatherMate
//
//  Created by admin on 21.06.2023.
//

import Foundation

class WeatherViewModel {
    
    // MARK: - Properties
    
    var weatherDetails: [WeatherDetails] = []

    var date: String {
        return "Сегодня"
        
    }
    
    var weatherType: String {
        guard let weatherType = weatherDetails.first?.weather.first?.main else {
            return "0"
        }
        switch weatherType {
        case "Clouds":
            return "Облачно"
        case "Rain":
            return "Дождливо"
        case "Clear":
            return "Солнечно"
        case "Wind":
            return "Ветренно"
        case "Snow":
            return "Ветренно"
        case "Storm":
            return "Шторм"
        default:
            return "Ошибка"
        }
    }
    
    var temperature: String {
        guard let temp = weatherDetails.first?.main.temp else {
            return "0"
        }
        
        return "\(String(describing: Int(temp) - 273))\u{00B0}"
    }
    
    var windSpeed: String {
        guard let wind = weatherDetails.first?.wind.speed else {
            return "0"
        }
        
        return "\(String(describing: wind)) м/с"
    }
    
    var feelingTemperature: String {
        guard let feel = weatherDetails.first?.main.feelsLike else {
            return "0"
        }
        return "Ощущается как: \(String(describing: Int(feel) - 273))\u{00B0}" // Замените на соответствующее свойство из weatherData
    }
    
    var pressure: String {
        guard let pressure = weatherDetails.first?.main.pressure else {
            return "0"
        }
        return "\(String(describing: Int(pressure))) мм рт.ст." // Замените на соответствующее свойство из weatherData
    }
    
    var time: String {
        if let nightWeather = findNightWeather() {
            let temperature = nightWeather.main.temp
            return "Ночью: \(String(Int(temperature) - 273))\u{00B0}"
        } else {
            // Погода на текущую ночь не найдена
        }
        return "00"
    }
    
    func findNightWeather() -> WeatherDetails? {
        let currentDate = Date()
        let calendar = Calendar.current
        let currentDay = calendar.component(.day, from: currentDate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        for weatherDetail in weatherDetails {
            if let date = dateFormatter.date(from: weatherDetail.dtTxt) {
                let components = calendar.dateComponents([.day, .hour], from: date)
                
                if let hour = components.hour, let day = components.day {
                    if day == currentDay && (hour == 21) {
                        return weatherDetail
                    }
                }
            }
        }
        
        return nil
    }
    func setWeatherData(_ weatherDetails: [WeatherDetails]) {
            self.weatherDetails = weatherDetails
        }
}
