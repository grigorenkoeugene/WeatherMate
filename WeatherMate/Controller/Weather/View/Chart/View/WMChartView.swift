//
//  ChartsView.swift
//  WeatherMate
//
//  Created by admin on 02.06.2023.
//

import UIKit

extension WMChartView {
    struct Data {
        let value: Int
        let title: String
        let percent: String
    }
}

final class WMChartView: BaseView {

    private let yAxisView = YAxisView()
    private let xAxisView = XAxisView()
    private let chartView = ChartView()

    func configure(with data: [WMChartView.Data], topChartOffset: Int = 4) {
        yAxisView.configure(with: data)
        xAxisView.configure(with: data)
        chartView.configure(with: data, topChartOffset: topChartOffset)
    }
}

extension WMChartView {
    override func setupViews() {
        super.setupViews()

        addSubview(yAxisView)
        addSubview(xAxisView)
        addSubview(chartView)
    }

    override func constaintViews() {
        super.constaintViews()

        yAxisView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().inset(2)
            make.bottom.equalTo(xAxisView.snp.top).offset(-38)
        }
        
        xAxisView.snp.makeConstraints { make in
            make.leading.equalTo(yAxisView.snp.trailing).offset(25)
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(5)
        }
        
        chartView.snp.makeConstraints { make in
            make.leading.equalTo(yAxisView.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(xAxisView.snp.top).inset(-10)
            
        }
    }

    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}

