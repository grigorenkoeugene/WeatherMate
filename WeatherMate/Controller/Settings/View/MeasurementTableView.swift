//
//  MeasurementTableView.swift
//  WeatherMate
//
//  Created by admin on 14.06.2023.
//

import UIKit

class MeasurementTableView: UITableView {
    
    init() {
        super.init(frame: .zero, style: .plain)
        setupTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MeasurementTableView {
    func setupTableView() {
            separatorStyle = .none
            layer.cornerRadius = 16
            backgroundColor = UIColor(hexString: "#F2F2F2")
            dataSource = self
            delegate = self
            let nib = UINib(nibName: "MeasurementTableViewCell", bundle: nil)

            register(nib, forCellReuseIdentifier: "cell")
            isScrollEnabled = false
            allowsSelection = false
        }
    
}
extension MeasurementTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MeasurementTableViewCell else { return UITableViewCell() }
            
        switch indexPath.row {
            case 0:
                cell.measurementsLabel.text = "Температура"
                cell.leftLabelText = "\u{00B0}С"
                cell.rightLabelText = "\u{00B0}F"
            case 1:
                cell.measurementsLabel.text = "Сила ветра"
                cell.leftLabelText = "м/с"
                cell.rightLabelText = "км/ч"
            case 2:
                cell.measurementsLabel.text = "Давление"
                cell.leftLabelText = "мм рт.ст."
                cell.rightLabelText = "гПа"
            default:
                break
            }
            
            return cell
        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        addSeparator(to: cell, at: indexPath, indent: 0)
    }
    
}
