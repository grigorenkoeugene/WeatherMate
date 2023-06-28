//
//  LocationTableView.swift
//  WeatherMate
//
//  Created by admin on 13.06.2023.
//

import UIKit

class LocationTableView: UITableView {
    
    init() {
        super.init(frame: .zero, style: .plain)
        setupTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LocationTableView {
    func setupTableView() {
        self.delaysContentTouches = false

            separatorStyle = .none
            layer.cornerRadius = 16
            backgroundColor = UIColor(hexString: "#F2F2F2")
            dataSource = self
            delegate = self
            let nib = UINib(nibName: "LocationTableViewCell", bundle: nil)

            register(nib, forCellReuseIdentifier: "cell")
//            isScrollEnabled = true
            allowsSelection = false
        }
    
}
extension LocationTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? LocationTableViewCell else { return UITableViewCell() }
        if indexPath.row == 0 {
            cell.title.text = "Место"
            cell.accessoryView = LocationTableViewCell().addCellButton
        } else {
            cell.title.text = "Минск"
            cell.title.textColor = Resource.Color.thirdColor
            cell.accessoryView = nil
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        addSeparator(to: cell, at: indexPath, indent: 0)
    }
    
}
