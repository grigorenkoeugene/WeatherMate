//
//  StackWinterWetPressureTableView.swift
//  WeatherMate
//
//  Created by admin on 09.06.2023.
//


import UIKit

class StackWinterWetPressureTableView: UITableView {
    
    private var data: [Weather] = []

    init(data: [Weather]) {
        super.init(frame: .zero, style: .plain)
        self.data = data
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StackWinterWetPressureTableView {
    func initialize() {
        separatorStyle = .none
        layer.cornerRadius = 24
        backgroundColor = UIColor(hexString: "#F2F2F2")
        dataSource = self
        delegate = self
        let nib = UINib(nibName: "WeatherTableViewCell", bundle: nil)
        register(nib, forCellReuseIdentifier: "cell")
        isScrollEnabled = false
        allowsSelection = false
    }
}

extension StackWinterWetPressureTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }

        let weatherData = data[indexPath.row]
        cell.dayType.text = weatherData.dayType
        cell.weatherTypeImage.image = UIImage(named: weatherData.weatherTypeImageName)
        cell.percent.text = weatherData.percent
        cell.lowTempricha.text = weatherData.lowTemperature
        cell.highTempricha.text = weatherData.highTemperature

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        addSeparator(to: cell, at: indexPath, indent: 66)
    }
}
