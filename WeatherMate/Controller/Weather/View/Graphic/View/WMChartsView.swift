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

        setupView(yAxisView)
        setupView(xAxisView)
        setupView(chartView)
    }

    override func constaintViews() {
        super.constaintViews()

        NSLayoutConstraint.activate([
            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisView.topAnchor.constraint(equalTo: topAnchor, constant: -3),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -48),

            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 8),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 4),

            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 16),
            chartView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -16),
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()

        backgroundColor = .clear
    }
}

