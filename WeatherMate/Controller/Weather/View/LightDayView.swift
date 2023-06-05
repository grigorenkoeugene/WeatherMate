//
//  lightDayView.swift
//  WeatherMate
//
//  Created by admin on 01.06.2023.
//

import UIKit

final class LightDayView: BaseView {
    
    
    var lightDayLabel: UILabel = {
        let label = UILabel()
        label.text = Resource.Strings.Weather.lightDay
        label.font = label.font.withSize(21)
        return label
    }()
    
    var timeLightDayLabel: UILabel = {
        let label = UILabel()
        label.text = "15 часов"
        label.textColor = Resource.Color.active
        label.font = label.font.withSize(21)
        return label
    }()
    
    var lightDayImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "lightDayImage")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    var lightDarkHouseImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "lightDarkHouseImage")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var sunriseLabel: UILabel = {
        let label = UILabel()
        label.text = "Восход"
        label.textColor = Resource.Color.sunriseSunset
        label.textAlignment = .center
        label.font = label.font.withSize(16)
        return label
    }()
    
    var sunsetLabel: UILabel = {
        let label = UILabel()
        label.text = "Закат"
        label.textColor = Resource.Color.sunriseSunset
        label.textAlignment = .center
        label.font = label.font.withSize(16)
        return label
    }()
    var timeSunriseLabel: UILabel = {
        let label = UILabel()
        label.text = "06:50"
        label.textColor = Resource.Color.timeSunriseSunset
        label.textAlignment = .center
        label.font = label.font.withSize(19)
        return label
    }()
    
    var timeSunsetLabel: UILabel = {
        let label = UILabel()
        label.text = "21:50"
        label.textColor = Resource.Color.timeSunriseSunset
        label.textAlignment = .center
        label.font = label.font.withSize(19)
        return label
    }()
    
}
extension LightDayView {
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = 24
        constaintViews()

    }
    override func constaintViews() {
        
        let stackView = UIStackView()
        let sunSRStackView = UIStackView()
        let timeSunSRStackView = UIStackView()
        
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        
        stackView.addArrangedSubview(lightDayImage)
        stackView.addArrangedSubview(lightDayLabel)
        stackView.addArrangedSubview(timeLightDayLabel)

        sunSRStackView.distribution = .fillEqually
        sunSRStackView.addArrangedSubview(sunriseLabel)
        sunSRStackView.addArrangedSubview(sunsetLabel)
        
        timeSunSRStackView.distribution = .fillEqually
        timeSunSRStackView.addArrangedSubview(timeSunriseLabel)
        timeSunSRStackView.addArrangedSubview(timeSunsetLabel)

        addSubview(stackView)
        addSubview(lightDarkHouseImage)
        addSubview(sunSRStackView)
        addSubview(timeSunSRStackView)


        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(13)
        }
        lightDayLabel.snp.makeConstraints { make in
            make.leading.equalTo(stackView.snp.leading).inset(60)
        }
        timeLightDayLabel.snp.makeConstraints { make in
            make.leading.equalTo(stackView.snp.leading).inset(220)
        }
        lightDarkHouseImage.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(stackView.snp.bottom).offset(24)
        }
        
        sunSRStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(lightDarkHouseImage.snp.bottom).offset(8)
        }
        timeSunSRStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(sunSRStackView.snp.bottom).offset(4)
        }
    }
    
}

