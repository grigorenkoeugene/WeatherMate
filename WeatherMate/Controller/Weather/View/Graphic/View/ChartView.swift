//
//  ChartView.swift
//  WeatherMate
//
//  Created by admin on 02.06.2023.
//

import UIKit

final class ChartView: BaseView {

    private let yAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Resource.Color.thirdColor
        return view
    }()

    private let xAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Resource.Color.thirdColor
        return view
    }()

    func configure(with data: [WMChartsView.Data], topChartOffset: Int) {

        layoutIfNeeded()
        drawDashLines()
        drawChart(with: data, topChartOffset: topChartOffset)
        
    }
}

extension ChartView {
    override func setupViews() {
        super.setupViews()

        setupView(yAxisSeparator)
        setupView(xAxisSeparator)
    }

    override func constaintViews() {
        super.constaintViews()

        NSLayoutConstraint.activate([
            yAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeparator.topAnchor.constraint(equalTo: topAnchor),
            yAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            yAxisSeparator.widthAnchor.constraint(equalToConstant: 1),

            xAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()

        backgroundColor = .clear

    }
}

private extension ChartView {
    func drawDashLines(with counts: Int = 4) {
        (0..<counts).map { CGFloat($0) }.forEach {
            drawDashLineY(at: bounds.height / CGFloat(counts) * $0)
            drawDashLineX(at: 300 / CGFloat(counts) * $0)

        }
    }

    func drawDashLineY(at yPosition: CGFloat) {
        let startPoint = CGPoint(x: -4, y: yPosition)
        let endPoint = CGPoint(x: 5, y: yPosition)

        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])

        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = Resource.Color.thirdColor.cgColor
        dashLayer.lineWidth = 1

        layer.addSublayer(dashLayer)
    }
    func drawDashLineX(at xPosition: CGFloat) {
        let startPoint = CGPoint(x: xPosition + 47, y: bounds.height - 5)
        let endPoint = CGPoint(x: xPosition + 47, y: bounds.height + 4)

        let dashPath = CGMutablePath()
        dashPath.addLines(between: [endPoint, startPoint]) // поменяли точки местами
        print("[endPoint, startPoint]", [endPoint, startPoint])
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = Resource.Color.thirdColor.cgColor
        dashLayer.lineWidth = 1


        layer.addSublayer(dashLayer)
    }

    
    func drawChart(with data: [WMChartsView.Data], topChartOffset: Int) {
        guard let maxValue = data.sorted(by: { $0.value > $1.value }).first?.value else { return }
        

        let valuePoints = data.enumerated().map { CGPoint(x: CGFloat($0), y: CGFloat($1.value)) }
        print(valuePoints)
        let chartHeight = bounds.height / 100

        
        let points = valuePoints.map {
                    let x = 47 + 224 / CGFloat(valuePoints.count - 1) * $0.x
                    let y = bounds.height - $0.y * chartHeight
                    print(CGPoint(x: x, y: y))
                    return CGPoint(x: x, y: y)
                }




        let chartPath = UIBezierPath()
        chartPath.move(to: points[0])

        for i in 1..<points.count-1 {
            // Определение контрольной точки для каждого сегмента
            let previousPoint = points[i-1]
            let currentPoint = points[i]
            let nextPoint = points[i+1]
            let controlPoint = CGPoint(x: currentPoint.x, y: currentPoint.y + (nextPoint.y - previousPoint.y) / 2)
            chartPath.addQuadCurve(to: nextPoint, controlPoint: controlPoint)
        }

        let chartLayer = CAShapeLayer()
        chartLayer.path = chartPath.cgPath
        chartLayer.fillColor = UIColor.clear.cgColor
        chartLayer.strokeColor = UIColor.blue.cgColor // Цвет линии
        chartLayer.lineWidth = 3 // Толщина линии
        chartLayer.lineJoin = .round

        layer.addSublayer(chartLayer)

    }

    func drawChartDot(at point: CGPoint) {
        let dotPath = UIBezierPath()
        dotPath.move(to: point)
        dotPath.addLine(to: point)

        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = Resource.Color.active.cgColor
        dotLayer.lineCap = .round
        dotLayer.lineWidth = 10

        layer.addSublayer(dotLayer)
    }
}

