//
//  WeatherViewModel.swift
//  WeatherMate
//
//  Created by admin on 21.06.2023.
//

import UIKit

class WeatherViewModel {
    
    // MARK: - Properties
    
    var weatherDetails: Welcome?
    
    var date: String {
        return "Сегодня"
        
    }
    
    var weatherType: String {
        guard let weatherType = weatherDetails?.current.condition.code else {
            return "0"
        }
        return getWeatherDescription(weatherCode: weatherType)
    }
    
    var weatherTypeImage: UIImage? {
        guard let weatherTypeImage = weatherDetails?.current.condition.code else {
            return UIImage(named: "cloud")
        }
        
        let imageName = getWeatherTypeDescription(weatherCode: weatherTypeImage)
        return UIImage(named: imageName)
    }
    
    var temperature: String {
        guard let tempC = weatherDetails?.current.tempC else { return "0" }
        return addPlus(tempC)
    }
    
    var windSpeed: String {
        guard let windSpeed = weatherDetails?.current.windKph else {
            return "0"
        }
        
        return "\(String(windSpeed)) м/с"
    }
    
    var feelingTemperature: String {
        guard let feelingTemp = weatherDetails?.current.feelslikeC else {
            return "0"
        }
        return "Ощущается как: \(addPlus(Int(feelingTemp)))\u{00B0}"
    }
    
    var pressure: String {
        guard let pressure = weatherDetails?.current.pressuremb else {
            return "0"
        }
        return "\(String(pressure)) мм рт.ст."
    }
    
    var time: String {
        if let nightWeather = findNightWeather() {
            let temperature = nightWeather.day.avgtempC
            return "Ночью: \(addPlus(Int(temperature)))\u{00B0}"
        } else {
            return "Нет данных о погоде на ночь"
        }
    }
    
    var directionWindImage: UIImage? {
        guard let pressure = weatherDetails?.current.windDir else {
            return UIImage(named: "cloud")
        }
        
        let imageName = getWeatherWind(weatherCode: pressure)
        return UIImage(named: imageName)
    }

    func findNightWeather() -> Forecastday? {
        let currentDate = Date()
        let calendar = Calendar.current
        let currentDay = calendar.component(.day, from: currentDate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        for weatherDetail in weatherDetails?.forecast.forecastday ?? [] {
            for hour in weatherDetail.hour {
                if let date = dateFormatter.date(from: hour.time) {
                    let components = calendar.dateComponents([.day, .hour], from: date)
                    
                    if let hour = components.hour, let day = components.day {
                        if day == currentDay && hour == 23 {
                            return weatherDetail
                        }
                    }
                }
            }
        }
        return nil
    }


    func setWeatherData(_ weatherDetails: Welcome) {
        self.weatherDetails = weatherDetails
    }
    func getWeatherTypeDescription(weatherCode: Int) -> String {
        switch weatherCode {
        case 1000:
            return "typeSun"
        case 1003, 1006:
            return "typeCloud"
        case 1009, 1063, 1153, 1195 :
            return "typeRain"
        case 1066, 1069, 1117:
            return "typeStorm"
        case 1087:
            return "typeSnow"
        default:
            return "typeMoon"
        }
    }
    func getWeatherDescription(weatherCode: Int) -> String {
        switch weatherCode {
        case 1000:
            return "Солнечно"
        case 1003:
            return "Переменная облачность"
        case 1006:
            return "Облачно"
        case 1009:
            return "Пасмурно"
        case 1030:
            return "Туман"
        case 1063:
            return "Возможен легкий дождь"
        case 1066:
            return "Возможен небольшой снег"
        case 1069:
            return "Возможна мокрый снег"
        case 1072:
            return "Возможен замерзающий дождь"
        case 1087:
            return "Возможны грозы"
        case 1114:
            return "Метель"
        case 1117:
            return "Снежная буря"
        case 1135:
            return "Туман"
        case 1147:
            return "Морозный туман"
        case 1150:
            return "Небольшой моросящий дождь"
        case 1153:
            return "Легкий дождь"
        case 1168:
            return "Замерзающий дождь"
        case 1171:
            return "Сильный замерзающий дождь"
        case 1180:
            return "Небольшой дождь"
        case 1183:
            return "Легкий дождь"
        case 1186:
            return "Периодически умеренный дождь"
        case 1189:
            return "Умеренный дождь"
        case 1192:
            return "Периодически сильный дождь"
        case 1195:
            return "Сильный дождь"
        case 1198:
            return "Небольшой ледяной дождь"
        case 1201:
            return "Умеренный или сильный ледяной дождь"
        case 1204:
            return "Легкий мокрый снег"
        case 1207:
            return "Умеренный или сильный мокрый снег"
        case 1210:
            return "Небольшой снег"
        case 1213:
            return "Легкий снег"
        case 1216:
            return "Периодически умеренный снег"
        case 1219:
            return "Умеренный снег"
        case 1222:
            return "Периодически сильный снег"
        case 1225:
            return "Сильный снег"
        case 1237:
            return "Ледяные капли"
        case 1240:
            return "Небольшой дождь"
        case 1243:
            return "Умеренный или сильный дождь"
        case 1246:
            return "Ливень"
        case 1249:
            return "Легкий мокрый снег"
        case 1252:
            return "Умеренный или сильный мокрый снег"
        case 1255:
            return "Легкий снег"
        case 1258:
            return "Умеренный или сильный снег"
        case 1261:
            return "Небольшие ледяные капли"
        case 1264:
            return "Умеренные или сильные ледяные капли"
        case 1273:
            return "Небольшой дождь с грозой"
        case 1276:
            return "Умеренный или сильный дождь с грозой"
        case 1279:
            return "Небольшой снег с грозой"
        case 1282:
            return "Умеренный или сильный снег с грозой"
        default:
            return "Ошибка"
        }
    }
    func getWeatherWind(weatherCode: String) -> String {
        switch weatherCode {
        case "WNW","NW","NNW":
            return "WindNW"
        case "NNE","NE","ENE":
            return "WindNE"
        case "ESE","SE","SSE":
            return "WindSE"
        case "SSW","SW","WSW":
            return "WindSW"
        case "N":
            return "WindN"
        case "E":
            return "WindE"
        case "S":
            return "WindS"
        case "W":
            return "WindW"
        default:
            return "W"
        }
    }
    
    func addPlus(_ value: Int) -> String {
        var temperatureString = String(value)
        if value > 0 {
            temperatureString = "+" + temperatureString
            return temperatureString
        } else {
            return String(value)
        }
        
    }
}
