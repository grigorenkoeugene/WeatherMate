//
//  SettingController.swift
//  WeatherMate
//
//  Created by admin on 31.05.2023.
//


import SnapKit
import UIKit

class SettingController: BaseController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let locationTableView = LocationTableView()
    private let measurementTableView = MeasurementTableView()
    private var constraintTableView: Constraint!
    private let titleLabel = UILabel(font: 14, textColor: Resource.Color.timeSunriseSunset)
    private let locationSwitchView = LocationSwitchView()
    private let aboutAppView = AboutAppView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        StatusBar().setStatusBar(for: self, with: .white, style: .darkContent)
    }
    
    func updateTableViewHeight() {
        let contentSize = locationTableView.contentSize.height
        constraintTableView.update(offset: contentSize)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateTableViewHeight()
    }
}

extension SettingController {
    override func setupViews() {
        super.setupViews()
        view.setupView(scrollView)
        scrollView.setupView(contentView)
        contentView.addSubview(locationTableView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(measurementTableView)
        contentView.addSubview(locationSwitchView)
        contentView.addSubview(aboutAppView)
        titleLabel.text = "Еденица измерения"


        self.navigationItem.title = "Минск"
        navigationController!.navigationBar.backgroundColor = .white
    }

    override func constraintViews() {
        super.constraintViews()

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        locationTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(32)
            make.leading.trailing.equalToSuperview()
            constraintTableView = make.height.equalTo(0).constraint
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(locationTableView.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(20)
        }
        
        measurementTableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(180)
        }
        locationSwitchView.snp.makeConstraints { make in
            make.top.equalTo(measurementTableView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(74)
        }
        aboutAppView.snp.makeConstraints { make in
            make.top.equalTo(locationSwitchView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
        }
    }
}
