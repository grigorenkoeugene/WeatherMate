//
//  WeekView.swift
//  WeatherMate
//
//  Created by admin on 07.06.2023.
//

import SnapKit
import UIKit

final class WeekView: BaseView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        return stackView
    }()}

extension WeekView {
    
    override func setupViews() {
        super.setupViews()
        setupView(stackView)
    }

    override func constaintViews() {
        super.constaintViews()
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    override func configureAppearance() {
        super.configureAppearance()

        var weekdays = Date.calendar.shortStandaloneWeekdaySymbols

        if Date.calendar.firstWeekday == 2 {
            let sun = weekdays.remove(at: 0)
            weekdays.append(sun)
        }

        weekdays.enumerated().forEach { index, name in
            let view = WeekdayView()
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
        }
        backgroundColor = .white

    }
}
