//
//  DateController.swift
//  WeatherMate
//
//  Created by admin on 31.05.2023.
//

import SnapKit
import UIKit

class DateController: BaseController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let navBar = DateNavBar()
    private let weatherTableView = WeatherTableView()
    private let winterView = WinterView()
}

extension DateController {
    override func setupViews() {
        super.setupViews()

        view.setupView(scrollView)
        scrollView.setupView(contentView)
//        contentView.addSubview([navBar, weatherTableView, winterView])
        contentView.addSubview(navBar)
        contentView.addSubview(weatherTableView)
        contentView.addSubview(winterView)

        title = "Минск"
        navigationController!.navigationBar.backgroundColor = .white
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }

    override func constraintViews() {
        super.constraintViews()

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(winterView.snp.bottom)
        }

        navBar.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).inset(0)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        
        weatherTableView.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)
        }
        
        winterView.snp.makeConstraints { make in
            make.top.equalTo(weatherTableView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)
        }
    }
}
