//
//  WeatherGraphicRaineView.swift
//  WeatherMate
//
//  Created by admin on 30.05.2023.
//

import SnapKit
import UIKit

class WeatherGraphicRaineView: BaseView {
    
    var precipitationLabel: UILabel = {
        let label = UILabel()
        label.text = Resource.Strings.Weather.precipitation
        label.font = label.font.withSize(21)
        
        return label
    }()
    
    var dropImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "dropView")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let chartsView = WMChartsView()
    
}

extension WeatherGraphicRaineView {
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        layer.cornerRadius = 24
        constaintViews()
        configureAppearance()

    }
    override func constaintViews() {
        let stackView = UIStackView()
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(dropImage)
        stackView.addArrangedSubview(precipitationLabel)

        addSubview(stackView)
        addSubview(chartsView)


        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
        precipitationLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(60)
        }
        
        chartsView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(stackView.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    override func configureAppearance() {
        configure(with: [.init(value: 100, title: "Сейчас", percent: "100%"),
                                                .init(value: 25, title: "15:55", percent: "25%"),
                                                .init(value: 75, title: "16:55", percent: "75%"),
                                                .init(value: 10, title: "17:55", percent: "10%")],
                                         topChartOffset: 4)
    }
    func configure(with itmes: [WMChartsView.Data], topChartOffset: Int) {
        chartsView.configure(with: itmes, topChartOffset: topChartOffset)
    }
}
