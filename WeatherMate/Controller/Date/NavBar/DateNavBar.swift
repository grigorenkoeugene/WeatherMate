//
//  DateNavBar.swift
//  WeatherMate
//
//  Created by admin on 07.06.2023.
//

import SnapKit
import UIKit

final class DateNavBar: BaseView {

    private let weekView = WeekView()

}

extension DateNavBar {
    override func setupViews() {
        super.setupViews()
        setupView(weekView)
    }

    override func constaintViews() {
        super.constaintViews()
        
        weekView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)

        }
    }

}
