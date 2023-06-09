//
//  WinterView.swift
//  WeatherMate
//
//  Created by admin on 08.06.2023.
//

import SnapKit
import UIKit

class WinterView: BaseView {
    
    let titleForView: TitleForView = {
        let component = TitleForView(imageName: "lightDayImage", labelText: Resource.Strings.Weather.lightDay)
        return component
    }()
    let tableView = WeatherTableView()
}

extension WinterView {
    override func setupViews() {
        super.setupViews()
        addSubview(titleForView)
        addSubview(tableView)
        backgroundColor = .white
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = 24
        constaintViews()

    }
    override func constaintViews() {
        titleForView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(8)
            
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleForView.snp.top).inset(50)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
