//
//  WeekdayView.swift
//  WeatherMate
//
//  Created by admin on 07.06.2023.
//

import SnapKit
import UIKit

extension WeekView {
    final class WeekdayView: BaseView {

        private let nameLabel: UILabel = {
            let lable = UILabel(font: 14, textColor: .white)
            lable.textAlignment = .center
            return lable
        }()

        private let dateLabel: UILabel = {
            let lable = UILabel(font: 21, textColor: .white)
            lable.textAlignment = .center
            return lable
        }()

        private let circleView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 15 // Радиус круга
            return view
        }()
        
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.spacing = 10
            view.axis = .vertical
            return view
        }()
        
        func configure(with index: Int, and name: String) {
            let startOfWeek = Date().startOfWeek
            let currenrDay = startOfWeek.agoForward(to: index)
            let day = Date.calendar.component(.day, from: currenrDay)

            let isToday = currenrDay.stripTime() == Date().stripTime()

            backgroundColor = .white

            nameLabel.text = name.uppercased()
            nameLabel.textColor = Resource.Color.sunriseSunset

            dateLabel.text = "\(day)"
            dateLabel.textColor = isToday ? .white : Resource.Color.timeSunriseSunset
            
            circleView.backgroundColor = isToday ? Resource.Color.active : .clear

        }
    }
}


extension WeekView.WeekdayView {
    override func setupViews() {
        super.setupViews()
        addSubview(circleView)
        setupView(stackView)

        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }

    override func constaintViews() {
        super.constaintViews()

        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        circleView.snp.makeConstraints { make in
            make.center.equalTo(dateLabel) // Центрируем круговую вьюшку относительно даты
            make.width.height.equalTo(30) // Размер круга
        }

    }

    override func configureAppearance() {
        super.configureAppearance()


    }
}
