//
//  ChartsView.swift
//  WeatherMate
//
//  Created by admin on 02.06.2023.
//

import UIKit

extension WMChartsView {
    struct Data {
        let value: Int
        let title: String
        let percent: String
    }
}

final class WMChartsView: BaseView {

    private let yAxisView = YAxisView()
    private let xAxisView = XAxisView()
    private let chartView = ChartView()

    func configure(with data: [WMChartsView.Data], topChartOffset: Int = 4) {
        yAxisView.configure(with: data)
        xAxisView.configure(with: data)
        chartView.configure(with: data, topChartOffset: topChartOffset)
    }
}

extension WMChartsView {
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
            make.top.equalToSuperview()
            make.bottom.equalTo(xAxisView.snp.top).offset(-48)
        }
        
        xAxisView.snp.makeConstraints { make in
            make.leading.equalTo(yAxisView.snp.trailing).offset(20)
            make.bottom.equalToSuperview().inset(10)
            make.trailing.equalTo(chartView.snp.trailing).inset(0)
        }
        
        chartView.snp.makeConstraints { make in
            make.leading.equalTo(yAxisView.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(xAxisView.snp.top).offset(-10)
            
        }
    }

    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}

