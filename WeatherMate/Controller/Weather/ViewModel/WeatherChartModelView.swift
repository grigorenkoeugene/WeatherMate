//
//  WeatherChartModelView.swift
//  WeatherMate
//
//  Created by admin on 06.07.2023.
//

import Foundation


class WeatherChartModelView {
    
    var weatherDetails: Welcome?
    
    
    var chanceOfRain: [Int] {
        return getWeatherData { $0.chanceOfRain }
    }

    var timeRain: [String] {
        return getWeatherData { chanceOfRain in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
            
            if let forecastDate = dateFormatter.date(from: chanceOfRain.time) {
                dateFormatter.dateFormat = "HH:mm"
                let timeString = dateFormatter.string(from: forecastDate)
                return timeString
            }
            
            return ""
        }
    }

    func getWeatherData<T>(_ dataClosure: (Hour) -> T) -> [T] {
        guard let chanceOfRains = weatherDetails?.forecast.forecastday.first?.hour else { return [] }
        
        let currentDate = Date()
        let calendar = Calendar.current
        let previousHour = calendar.date(byAdding: .hour, value: -1, to: currentDate) ?? Date.now
        
        var forecastData: [T] = []
        let maxHoursAhead = 4
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        for chanceOfRain in chanceOfRains {
            
            
            if let forecastDate = dateFormatter.date(from: chanceOfRain.time), forecastDate >= previousHour {
                let data = dataClosure(chanceOfRain)
                forecastData.append(data)
                if forecastData.count >= maxHoursAhead {
                    return forecastData
                }
            }
        }
        
        return []
    }


    func setWeatherData(_ weatherDetails: Welcome) {
        self.weatherDetails = weatherDetails
    }
}
