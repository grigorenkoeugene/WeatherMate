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
        print(chartsView.bounds.height)

        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }
        precipitationLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(60)
        }
        
        chartsView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(50)

            make.bottom.equalToSuperview().inset(10)
            make.height.equalTo(200)
        }
    }
    
    override func configureAppearance() {
        configure(with: [.init(value: 10, title: "Сейчас"),
                                                .init(value: 10, title: "15:55"),
                                                .init(value: 10, title: "16:55"),
                                                .init(value: 15, title: "17:55")],
                                         topChartOffset: 4)
    }
    func configure(with itmes: [WMChartsView.Data], topChartOffset: Int) {
        chartsView.configure(with: itmes, topChartOffset: topChartOffset)
    }
}
