//
//  WeatherTableView.swift
//  WeatherMate
//
//  Created by admin on 07.06.2023.
//

import UIKit

class WeatherTableView: UITableView {
    
    init() {
        super.init(frame: .zero, style: .plain)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension WeatherTableView {
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
extension WeatherTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        
        cell.dayType.text = "Утро"
        cell.weatherTypeImage.image = UIImage(named: "cloud")
        cell.percent.text = "23%"
        cell.lowTempricha.text = "+11"
        cell.highTempricha.text = "+11"

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        addSeparator(to: cell, at: indexPath)
    }
}
