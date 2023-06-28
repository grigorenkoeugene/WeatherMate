//
//  ConstellationsTableView.swift
//  WeatherMate
//
//  Created by admin on 01.06.2023.
//

import UIKit

class BaseConstellationsTableView: UITableView {
    
    init() {
        super.init(frame: .zero, style: .plain)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BaseConstellationsTableView {
    func initialize() {
        separatorStyle = .none
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        layer.cornerRadius = 24
        backgroundColor = UIColor(hexString: "#F2F2F2")
        dataSource = self
        delegate = self
        let nib = UINib(nibName: "ConstellationsTableViewCell", bundle: nil)
        register(nib, forCellReuseIdentifier: "cell")
    }
    
}
extension BaseConstellationsTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ConstellationsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.title.text = "Звездопад"
        cell.time.text = "02:43"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        addSeparator(to: cell, at: indexPath, indent: 66)
    }
}


