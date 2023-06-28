//
//  LocationSwitchView.swift
//  WeatherMate
//
//  Created by admin on 19.06.2023.
//

import UIKit
import SnapKit

class LocationSwitchView: BaseView {
    private let geoLocationLabel = UILabel(font: 16, textColor: Resource.Color.timeSunriseSunset)
    private let switchLocation = UISwitch()
    private let predictionAccuracyLabel = UILabel(font: 14, textColor: Resource.Color.thirdColor)
}

extension LocationSwitchView {
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        layer.cornerRadius = 24
        geoLocationLabel.text = "Геолокация"
        predictionAccuracyLabel.text = "Если включить, прогноз станет точнее"
    }
    
    override func constaintViews() {
        let stackView = UIStackView()
        addSubview(stackView)
        addSubview(predictionAccuracyLabel)
        stackView.addArrangedSubview(geoLocationLabel)
        stackView.addArrangedSubview(switchLocation)
    
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(30)
        }
        predictionAccuracyLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(stackView.snp.bottom)
            make.height.equalTo(20)
        }
    }
    
}

