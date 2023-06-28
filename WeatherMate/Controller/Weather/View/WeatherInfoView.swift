//
//  WeatherSubView.swift
//  WeatherMate
//
//  Created by admin on 26.05.2023.
//

import SnapKit
import UIKit

class WeatherInfoView: BaseView {

    private var dateLable = UILabel(font: 21, textColor: .white)
    private var typeWeatherLable = UILabel(font: 16, textColor: .white)
    private var temprichaLable = UILabel(font: 76, textColor: .white)
    private var speedWindWeather = UILabel(font: 19, textColor: .white)
    private var feelingWeather = UILabel(font: 16, textColor: .white)
    private var pressure = UILabel(font: 19, textColor: .white)
    private var time = UILabel(font: 16, textColor: .white)
    
    private var weatherWindImage = UIImageView(named: "weatherWind")
    private var directionWindImage = UIImageView(named: "directionWind")
    private var pressureImage = UIImageView(named: "pressure")
    private var locatonImage = UIImageView(named: "location")

    private var cloudImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "cloud")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private var mauntainImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "mountain")
        imageView.image = image
        imageView.clipsToBounds = false
        return imageView
    }()

    init() {
        super.init(frame: .zero)
        initialize()

        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configur(with info: WeatherViewModel) {
        dateLable.text = info.date
        typeWeatherLable.text = info.weatherType
        temprichaLable.text = info.temperature
        speedWindWeather.text = info.windSpeed
        feelingWeather.text = info.feelingTemperature
        pressure.text = info.pressure
        time.text = info.time
    }

    

}

private extension WeatherInfoView {

    func initialize() {
        
        clipsToBounds = true
        backgroundColor = Resource.Color.weatherInfoViewBackground
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        layer.cornerRadius = 25
        addSubview(mauntainImage)
        mauntainImage.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(0)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(85)
        }
        
        let upStak = UIStackView()
        upStak.addArrangedSubview(locatonImage)
        upStak.addArrangedSubview(dateLable)
        upStak.addArrangedSubview(typeWeatherLable)
        addSubview(upStak)
        upStak.distribution = .fillProportionally

        dateLable.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(120)
        }
        upStak.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(13)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(30)
            make.height.equalTo(30)
        }
//        typeWeatherLable.snp.makeConstraints { make in
//            make.trailing.equalTo(upStak.snp.trailing).offset(2000)
//        }
        let temprichaCloud = UIStackView()
        temprichaCloud.axis = .horizontal
        temprichaCloud.distribution = .fillProportionally
        temprichaCloud.addArrangedSubview(temprichaLable)
        temprichaCloud.addArrangedSubview(cloudImage)
        
        addSubview(temprichaCloud)
        
        cloudImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(200)
        }
        temprichaCloud.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(28)
            make.top.equalTo(upStak.snp.bottom).inset(-15)
            make.height.equalTo(100)
        }
        let wetherWind = UIStackView()
        let feelingWeatherStackView = UIStackView()
        let stackWetherWind = UIStackView()
        
        wetherWind.axis = .horizontal
        feelingWeatherStackView.axis = .horizontal
        stackWetherWind.axis = .horizontal
        stackWetherWind.distribution = .equalCentering

        wetherWind.spacing = 10
        wetherWind.addArrangedSubview(weatherWindImage)
        wetherWind.addArrangedSubview(speedWindWeather)
        wetherWind.addArrangedSubview(directionWindImage)
        
        feelingWeatherStackView.addArrangedSubview(feelingWeather)
        
        stackWetherWind.addArrangedSubview(wetherWind)
        stackWetherWind.addArrangedSubview(feelingWeatherStackView)
        
        addSubview(stackWetherWind)
        
        stackWetherWind.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(self).inset(250)
            make.height.equalTo(50)
        }
        let pressureStackView = UIStackView()
        let timeStackView = UIStackView()
        let stackWetherPressure = UIStackView()
        
        pressureStackView.axis = .horizontal
        timeStackView.axis = .horizontal
        stackWetherPressure.axis = .horizontal
        
        pressureStackView.spacing = 10
        stackWetherPressure.distribution = .equalCentering

        
        pressureStackView.addArrangedSubview(pressureImage)
        pressureStackView.addArrangedSubview(pressure)
        
        timeStackView.addArrangedSubview(time)
        
        stackWetherPressure.addArrangedSubview(pressureStackView)
        stackWetherPressure.addArrangedSubview(timeStackView)

        addSubview(stackWetherPressure)
        
        stackWetherPressure.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(self).inset(10)
            make.height.equalTo(50)
        }

    }

    
}



private extension UIImageView {
    convenience init(named: String) {
        self.init()
        self.image = UIImage(named: named)
        self.image = self.image!.withRenderingMode(.alwaysTemplate)
        self.tintColor = .white
        self.contentMode = .scaleAspectFit
        
    }
}
