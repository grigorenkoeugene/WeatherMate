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
    
    private var chartData: [WMChartView.Data] = []
    private var topChartOffset: Int = 0
        
    override func layoutSubviews() {
        super.layoutSubviews()
        
        drawChart(with: chartData, topChartOffset: topChartOffset)
        drawDashLines()
    }
    
    func configure(with data: [WMChartView.Data], topChartOffset: Int) {
        self.chartData = data
        self.topChartOffset = topChartOffset
        setNeedsLayout()
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
        
        yAxisSeparator.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(1)
        }

        xAxisSeparator.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }

    }

    override func configureAppearance() {
        super.configureAppearance()

        backgroundColor = .clear
    }
    
}

extension ChartView {
    func drawDashLines(with counts: Int = 4) {
        (0..<counts).map { CGFloat($0) }.forEach {
            drawDashLineY(at: bounds.height / CGFloat(counts) * $0)
            drawDashLineX(at: bounds.width / CGFloat(counts) * $0)
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
        let startPoint = CGPoint(x: xPosition + 50, y: bounds.height - 5)
        let endPoint = CGPoint(x: xPosition + 50, y: bounds.height + 4)
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = Resource.Color.thirdColor.cgColor
        dashLayer.lineWidth = 1
        
        layer.addSublayer(dashLayer)
    }

    
    func drawChart(with data: [WMChartView.Data], topChartOffset: Int) {
        let valuePoints = data.enumerated().map { CGPoint(x: CGFloat($0), y: CGFloat($1.value)) }
        let chartHeight = frame.height / 100
        let xStep = (frame.width / 1.335)
        let points = valuePoints.map {
            let x = 50 + xStep / CGFloat(valuePoints.count - 1) * $0.x
            let y = frame.height - $0.y * chartHeight
            return CGPoint(x: x, y: y)
        }
        
        let chartPath = UIBezierPath()
        fetchWeatherData        chartPath.move(to: points[0])
        drawChartDot(at: points[0])
        
        for i in 0..<points.count - 1 {
            let startPoint = points[i]
            let endPoint = points[i+1]
            
            let dx = endPoint.x - startPoint.x
            let controlPoint1 = CGPoint(x: startPoint.x + dx/2, y: startPoint.y)
            let controlPoint2 = CGPoint(x: endPoint.x - dx/2, y: endPoint.y)
            chartPath.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
            drawChartDot(at: endPoint)
        }
        
        let chartLayer = CAShapeLayer()
        chartLayer.path = chartPath.cgPath
        chartLayer.fillColor = UIColor.clear.cgColor
        chartLayer.strokeColor = Resource.Color.active.cgColor
        chartLayer.lineWidth = 2
        chartLayer.strokeEnd = 1
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
        dotLayer.lineWidth = 9

        layer.addSublayer(dotLayer)
    }
}

