//
//  BaseTableView.swift
//  WeatherMate
//
//  Created by admin on 08.06.2023.
//

import UIKit


class BaseTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
        setupTable()
        constaintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTable()
        constaintViews()
        configureAppearance()
    }
}

@objc extension BaseTableView {
    func setupTable() {
        separatorStyle = .none
        dataSource = self
        delegate = self
    }
    
    func constaintViews() {}
    
    func configureAppearance() {
        backgroundColor = .white
    }

}
