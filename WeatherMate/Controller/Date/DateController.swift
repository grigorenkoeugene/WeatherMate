//
//  DateController.swift
//  WeatherMate
//
//  Created by admin on 31.05.2023.
//

import SnapKit
import UIKit

class DateController: BaseController {
    private let scrollView = UIScrollView()
        private let contentView = UIView()
        private let navBar = DateNavBar()
        private let weatherTableView = WeatherTableView()
        private let baseLightView = BaseLightDayView()
        private let constellationsTableView = BaseConstellationsTableView()
        
        private let winterView: WinterView
        private let wetView: WetView
        private let pressureView: PressureView

        let winterData: [WeatherData] = [
            WeatherData(dayType: "Утро", weatherTypeImageName: "directionWind", percent: "С-В", lowTemperature: "3-6", highTemperature: "м/с"),
            WeatherData(dayType: "День", weatherTypeImageName: "directionWind", percent: "С-В", lowTemperature: "3-6", highTemperature: "м/с"),
            WeatherData(dayType: "Вечер", weatherTypeImageName: "directionWind", percent: "С-В", lowTemperature: "3-6", highTemperature: "м/с"),
            WeatherData(dayType: "Ночь", weatherTypeImageName: "directionWind", percent: "С-В", lowTemperature: "3-6", highTemperature: "м/с")
        ]
    
        let wetData: [WeatherData] = [
            WeatherData(dayType: "Утро", weatherTypeImageName: "wetImage", percent: "Высокая", lowTemperature: "35%", highTemperature: ""),
            WeatherData(dayType: "День", weatherTypeImageName: "wetImage", percent: "Высокая", lowTemperature: "35%", highTemperature: ""),
            WeatherData(dayType: "Вечер", weatherTypeImageName: "wetImage", percent: "Высокая", lowTemperature: "35%", highTemperature: ""),
            WeatherData(dayType: "Ночь", weatherTypeImageName: "wetImage", percent: "Высокая", lowTemperature: "35%", highTemperature: "")
        ]
    
        let pressureData: [WeatherData] = [
            WeatherData(dayType: "Утро", weatherTypeImageName: "", percent: "777", lowTemperature: "мм рт. ст.", highTemperature: ""),
            WeatherData(dayType: "День", weatherTypeImageName: "", percent: "777", lowTemperature: "мм рт. ст.", highTemperature: ""),
            WeatherData(dayType: "Вечер", weatherTypeImageName: "", percent: "777", lowTemperature: "мм рт. ст.", highTemperature: ""),
            WeatherData(dayType: "Ночь", weatherTypeImageName: "", percent: "777", lowTemperature: "мм рт. ст.", highTemperature: "")
        ]

        init() {
            winterView = WinterView(weatherData: winterData)
            wetView = WetView(weatherData: wetData)
            pressureView = PressureView(weatherData: pressureData)
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension DateController {
    override func setupViews() {
        super.setupViews()

        view.setupView(scrollView)
        scrollView.setupView(contentView)
        contentView.addSubview(navBar)
        contentView.addSubview(weatherTableView)
        contentView.addSubview(winterView)
        contentView.addSubview(wetView)
        contentView.addSubview(pressureView)
        contentView.addSubview(baseLightView)
        contentView.addSubview(constellationsTableView)

        title = "Минск"
        navigationController!.navigationBar.backgroundColor = .white
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }

    override func constraintViews() {
        super.constraintViews()

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(constellationsTableView.snp.bottom).offset(20)
        }

        navBar.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).inset(0)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        weatherTableView.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)
        }
        
        winterView.snp.makeConstraints { make in
            make.top.equalTo(weatherTableView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(240)
        }
        
        wetView.snp.makeConstraints { make in
            make.top.equalTo(winterView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(240)
        }
        
        pressureView.snp.makeConstraints { make in
            make.top.equalTo(wetView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(240)
        }
        baseLightView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(pressureView.snp.bottom).offset(8)
            make.height.equalTo(320)
        }
        constellationsTableView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(baseLightView.snp.bottom).offset(2)
            make.height.equalTo(210)
        }
    }
}
