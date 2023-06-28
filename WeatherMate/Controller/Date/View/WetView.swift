//
//  WetView.swift
//  WeatherMate
//
//  Created by admin on 09.06.2023.
//

import SnapKit
import UIKit

class WetView: BaseView {
    
    let titleForView: BaseTitleForView = {
        let component = BaseTitleForView(imageName: Resource.Images.wet!, labelText: Resource.Strings.DateWeather.wet)
        return component
    }()
    let tableView: StackWinterWetPressureTableView

    // Инициализация с данными
    init(weatherData: [Weather]) {
        self.tableView = StackWinterWetPressureTableView(data: weatherData)
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WetView {
    override func setupViews() {
        super.setupViews()
        addSubview(titleForView)
        addSubview(tableView)
        backgroundColor = .white
        layer.cornerRadius = 24
        constaintViews()
    }

    override func constaintViews() {
        titleForView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(8)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleForView.snp.top).inset(60)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

