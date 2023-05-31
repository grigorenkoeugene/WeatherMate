//
//  WeatherSubView.swift
//  WeatherMate
//
//  Created by admin on 26.05.2023.
//

import SnapKit
import UIKit

class WeatherSubView: UIView {

    func configur(with info: WeatherModel) {
        dateLable.text = "Сегодня"
        typeWeatherLable.text = "Облачно"
        temprichaLable.text = "-25\u{00B0}"
        speedWindWeather.text = "9 м/с"
        feelingWeather.text = "Ощущается как: -30\u{00B0}"
        pressure.text = "732 мм рт.ст."
        time.text = "Ночью -23\u{00B0}"
    }
    
    private var dateLable = UILabel(font: 21)
    private var typeWeatherLable = UILabel(font: 16)
    private var temprichaLable = UILabel(font: 76)
    private var speedWindWeather = UILabel(font: 19)
    private var feelingWeather = UILabel(font: 16)
    private var pressure = UILabel(font: 19)
    private var time = UILabel(font: 16)
    
    private var cloudImage = UIImageView(named: "cloud")
    private var weatherWindImage = UIImageView(named: "weatherWind")
    private var directionWindImage = UIImageView(named: "directionWind")
    private var pressureImage = UIImageView(named: "pressure")
    private var locatonImage = UIImageView(named: "location")
    
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
    
}

private extension WeatherSubView {

    func initialize() {
        clipsToBounds = true
        backgroundColor = UIColor(hexString: "#195BD1")
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        layer.cornerRadius = 25
        addSubview(mauntainImage)
        mauntainImage.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(0)
            make.top.equalToSuperview().inset(170)
        }
        setupStackViewUp()
        setupStackViewTemprichaCloud()
        setupStackViewWetherWind()
        setupStackViewPressure()
    }
    
    func setupStackViewUp() {
        let upStak = UIStackView()
        upStak.axis = .horizontal
        upStak.addArrangedSubview(locatonImage)
        upStak.addArrangedSubview(dateLable)
        upStak.addArrangedSubview(typeWeatherLable)
        addSubview(upStak)

        dateLable.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(40)
        }
        typeWeatherLable.snp.makeConstraints { make in
            make.left.equalTo(dateLable).offset(200)
        }
        upStak.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(100)
            make.height.equalTo(30)
        }
    }
    
    func setupStackViewTemprichaCloud() {
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
            make.top.equalTo(self).inset(150)
            make.height.equalTo(100)
        }
    }
    func setupStackViewWetherWind() {
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
    }
    func setupStackViewPressure() {
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

private extension UILabel {
    convenience init(font: CGFloat) {
        self.init()
        self.font = self.font.withSize(font)
        
        self.textColor = .white
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

